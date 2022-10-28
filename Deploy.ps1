Param(
	[Parameter(Mandatory=$true)]
	[string]$ver
)
#setup docker to deploy into the cluster
minikube docker-env | invoke-Expression

#Create the image
docker build -t copa:$ver -f Dockerfile .

#Fill out the YAML template file to have the correct version
$template = get-content kube_uat.template.yaml -raw
$yaml = $template -replace "{{VERSION}}",$ver
$yaml | set-content -path kube.yaml

#update cluster
kubectl apply -f kube.yaml
