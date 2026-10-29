resource "azurerm_application_insights" "application_insights" {
    count = var.application_insight ? 1 : 0 
    name                  = "${var.prefix}-insights-${var.name}"
    location              = var.location
    resource_group_name   = var.resource_group_name
    application_type      = "web"
}

resource "azurerm_windows_function_app" "function" {
    name                = "${var.prefix}-function-app-${var.name}"
    resource_group_name = var.resource_group_name
    location            = var.location

    storage_account_name       = name
    storage_account_access_key = primary_access_key
    service_plan_id            = var.service_plan_id

    virtual_network_subnet_id  = var.virtual_network_subnet_id

    app_settings = {
        APPINSIGHTS_INSTRUMENTATIONKEY              = var.application_insight ? azurerm_application_insights.application_insights[0].instrumentation_key : null
        APPLICATIONINSIGHTS_CONNECTION_STRING       = var.application_insight ? azurerm_application_insights.application_insights[0].connection_string : null
        ApplicationInsightsAgent_EXTENSION_VERSION  = var.application_insight ? "~3" : null
    }

    site_config {
        
    }

    tags = var.tags
}