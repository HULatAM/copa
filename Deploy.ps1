Param(
	[Parameter(Mandatory=$true)]
	[string]$ver
)

Write-Host "Version: $ver"

# setup docker to deploy into the cluster
minikube docker-env | Invoke-Expression

# Create the image
docker build -t copa:$ver -f Dockerfile .

# Fill out the YAML template file to have the correct version
$template = Get-Content kube.template.yaml -raw
$yaml = $template -replace "{{VERSION}}",$ver
$yaml | Set-Content -Path kube.yaml

#Update cluster
kubectl apply -f kube.yaml
