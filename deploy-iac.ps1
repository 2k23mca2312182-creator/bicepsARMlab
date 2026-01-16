param (
    [string]$ResourceGroupName = "IaCLabRG-shagun",
    [string]$TemplateFile = "webapp.bicep"
)

Write-Host "Starting deployment to resource group: $ResourceGroupName"

# Confirm Azure CLI login
az account show 1>$null 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "You are not logged in to Azure CLI. Running az login..." -ForegroundColor Yellow
    az login
}

# Deploy using Azure CLI
az deployment group create `
  --resource-group $ResourceGroupName `
  --template-file $TemplateFile `
  --mode Incremental `
  --output table

Write-Host "Deployment complete. Review resources in the Azure Portal."
