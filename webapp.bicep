param location string = 'koreacentral'
param appServicePlanName string = 'bicepAppServicePlan'
param webAppName string = 'bicepWebAppDemo'

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
 name: '${appServicePlanName}-shagun'

  location: location
  sku: {
    name: 'F1'
    capacity: 1
  }
}

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: '${webAppName}-shagun'

  location: location
  properties: {
    serverFarmId: appServicePlan.id
  }
}