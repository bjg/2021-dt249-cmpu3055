$ResourcePrefix = "21-3055-12345678"
$ResourceGroupName = $ResourcePrefix + "-rg"
$ServerVM = $ResourcePrefix + "-vm4"
$DatabaseServer  =$ResourcePrefix + "-db4"

az vm delete --resource-group $ResourceGroupName --name $ServerVM

az postgres server delete --resource-group $ResourceGroupName --name $ServerVM