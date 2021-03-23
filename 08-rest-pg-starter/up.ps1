# Requires some AZ Powershell Modules to be installed. See here:
# https://docs.microsoft.com/en-us/powershell/azure/new-azureps-module-az?view=azps-5.6.0

# Install-Module -Name Az.Compute -Scope CurrentUser
# Install-Module -Name Az.PostgreSql -Scope CurrentUser
# Connect-AzAccount -Subscription <your_sub_id>

$ResourcePrefix = "21-3055-12345678"
$ResourceGroupName = $ResourcePrefix + "-rg"
$ServerVM = $ResourcePrefix + "-vm4"
$DatabaseServer  =$ResourcePrefix + "-db4"
$DatabaseSKU = "B_Gen5_1"
$AdminUser = "cmpu3055"
$AdminPassword = "bBFYNE2cFwh55tgJ"
$LocationName = "eastus"

if ( Get-AzVM -ResourceGroup $ResourceGroupName -Name $ServerVM -Status -ErrorAction SilentlyContinue)
{
    echo "REST API server $ServerVM already exists"
} else {
    echo "Creating REST API server $ServerVM ..."
    az vm create --resource-group $ResourceGroupName --name $ServerVM --image debian --admin-username $AdminUser --generate-ssh-keys
    az vm open-port --port 5000 --resource-group $ResourceGroupName --name $ServerVM
    $ServerIP = (az vm show -d -g $ResourceGroupName -n $ServerVM --query publicIps -o tsv)
    echo "Done"
}

if ( Get-AzPostgreSqlServer -ResourceGroup $ResourceGroupName -Name $DatabaseServer -ErrorAction SilentlyContinue)
{
    echo "Postgres database server $DatabaseServer already exists"
} else {
    echo "Creating Postgres database instance $DatabaseServer ..."
    az postgres server create --resource-group $ResourceGroupName --name $DatabaseServer  --location $LocationName --admin-user $AdminUser --admin-password $AdminPassword --sku-name $DatabaseSKU
    az postgres server firewall-rule create --resource-group $ResourceGroupName --server $DatabaseServer --name AllowServerIP --start-ip-address $ServerIP --end-ip-address $ServerIP
    echo "Done"
}
