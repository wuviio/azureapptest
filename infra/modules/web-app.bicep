@description('The name of the web app')
param name string

@description('The location of the web app')
param location string

@description('The kind of web app')
param kind string = 'app'

@description('The ID of the App Service Plan')
param serverFarmResourceId string

@description('The site configuration')
param siteConfig object

@description('Application settings')
param appSettingsKeyValuePairs object

resource webApp 'Microsoft.Web/sites@2022-09-01' = {
  name: name
  location: location
  kind: kind
  properties: {
    serverFarmId: serverFarmResourceId
    siteConfig: siteConfig
  }
}

resource webAppSettings 'Microsoft.Web/sites/config@2022-09-01' = {
  parent: webApp
  name: 'appsettings'
  properties: appSettingsKeyValuePairs
}

output name string = webApp.name
output defaultHostName string = webApp.properties.defaultHostName 
