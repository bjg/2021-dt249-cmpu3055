### Install Docker

`sudo apt update sudo apt upgrade sudo apt-get remove docker docker-engine docker.io containerd runc sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release clear echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \ $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null clear sudo apt update sudo apt-get install docker-ce docker-ce-cli containerd.io docker sudo usermod -G docker -a parallels`

### Build the image

`docker build -t my-flask-app .`

### Run the container and make sure it worked

`docker run -d --name flask-app my-flask-app docker container list`

### Make the REST API calls

`
curl http://172.17.0.3:5000/customers
curl http://172.17.0.3:5000/customers/1

`
