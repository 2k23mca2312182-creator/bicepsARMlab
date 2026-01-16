param location string = 'koreacentral'
param appServicePlanName string = 'bicepAppServicePlan'
param webAppName string = 'bicepWebAppDemoAutomated'

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
 name: '${appServicePlanName}-AutomatedbyShagunGithub'

  location: location
  sku: {
    name: 'F1'
    capacity: 1
  }
}

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: '${webAppName}-AutomatedbyShagunGithub'

  location: location
  properties: {
    serverFarmId: appServicePlan.id
  }
}