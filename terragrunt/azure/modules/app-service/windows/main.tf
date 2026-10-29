resource "azurerm_application_insights" "application_insights" {
    count = var.application_insight ? 1 : 0 
    name                  = "${var.prefix}-insights-${var.name}"
    location              = var.location
    resource_group_name   = var.resource_group_name
    application_type      = "web"
    workspace_id          = var.workspace_id
    tags                  = var.tags
}

resource "azurerm_windows_web_app" "webapp" {
    name                        = "${var.prefix}-webapp-${var.name}"
    location                    = var.location
    resource_group_name         = var.resource_group_name
    service_plan_id             = var.service_plan_id
    virtual_network_subnet_id   = var.virtual_network_subnet_id
    https_only                  = true

    app_settings = {
        APPINSIGHTS_INSTRUMENTATIONKEY              = var.application_insight ? azurerm_application_insights.application_insights[0].instrumentation_key : null
        APPLICATIONINSIGHTS_CONNECTION_STRING       = var.application_insight ? azurerm_application_insights.application_insights[0].connection_string : null
        ApplicationInsightsAgent_EXTENSION_VERSION  = var.application_insight ? "~3" : null
    }

    site_config {
        always_on                           = true
        vnet_route_all_enabled              = var.virtual_network_subnet_id != null
        minimum_tls_version                 = "1.2"
        scm_use_main_ip_restriction         = false
        use_32_bit_worker                   = false
        ip_restriction_default_action       = "Deny"
        scm_ip_restriction_default_action   = "Deny"
        websockets_enabled                  = var.websockets_enabled

        dynamic "ip_restriction" {
            for_each = var.virtual_network_subnet_id != null ? ["vnet"] : []
            content {
                virtual_network_subnet_id   = var.virtual_network_subnet_id
                action                      = "Allow"
                priority                    = 100
                name                        = "Azure Production VNet"
            }
        }

        dynamic "virtual_application" {
             for_each = var.virtual_application
            content {
                physical_path   = "site\\wwwroot"
                preload         = true
                virtual_path    = each.virtual_path
            }
        }

        # ip_restriction {
        #     virtual_network_subnet_id = "/subscriptions/3065bfa3-4d71-4423-979a-8e0d9be7726a/resourceGroups/octopus_production/providers/Microsoft.Network/virtualNetworks/octopus_production-vnet/subnets/default"
        #     action     = "Allow"
        #     priority   = 100
        #     name       = "Azure Production K8S"
        # }
        
        ip_restriction {
            ip_address = var.office_ip_address
            action     = "Allow"
            priority   = 200
            name       = "Office"
        }

        scm_ip_restriction {
            ip_address = var.office_ip_address
            action     = "Allow"
            priority   = 200
            name       = "Office"
        }
    }

    tags = var.tags

    lifecycle {
        ignore_changes = [
            logs,
            sticky_settings,
            connection_string,
            app_settings,
            identity,
            site_config.0.ip_restriction,
            site_config.0.application_stack,
            site_config.0.virtual_application
        ]
    }
}

resource "azurerm_windows_web_app_slot" "slots" {
    for_each                    = var.slots
    name                        = each.value
    app_service_id              = azurerm_windows_web_app.webapp.id
    virtual_network_subnet_id   = var.virtual_network_subnet_id
    https_only                  = true
    
    app_settings = {
        APPINSIGHTS_INSTRUMENTATIONKEY              = azurerm_application_insights.application_insights[0].instrumentation_key
        APPLICATIONINSIGHTS_CONNECTION_STRING       = azurerm_application_insights.application_insights[0].connection_string
        ApplicationInsightsAgent_EXTENSION_VERSION  = "~3"
    }

    site_config {
        always_on                           = true
        vnet_route_all_enabled              = var.virtual_network_subnet_id != null
        minimum_tls_version                 = "1.2"
        scm_use_main_ip_restriction         = false
        use_32_bit_worker                   = false
        ip_restriction_default_action       = "Deny"
        scm_ip_restriction_default_action   = "Deny"
        websockets_enabled                  = var.websockets_enabled

        dynamic "ip_restriction" {
            for_each = var.virtual_network_subnet_id != null ? ["vnet"] : []
            content {
                virtual_network_subnet_id   = var.virtual_network_subnet_id
                action                      = "Allow"
                priority                    = 100
                name                        = "Azure Production VNet"
            }
        }

        dynamic "virtual_application" {
            for_each = var.virtual_application
            content {
                physical_path   = "site\\wwwroot"
                preload         = true
                virtual_path    = each.virtual_path
            }
        }
        
        ip_restriction {
            ip_address = var.office_ip_address
            action     = "Allow"
            priority   = 200
            name       = "Office"
        }

        scm_ip_restriction {
            service_tag = "AzureCloud.canadacentral"
            action      = "Allow"
            priority    = 100
            name        = "Azure Devops Pipeline"
        }

        scm_ip_restriction {
            service_tag = "AzureCloud.canadaeast"
            action      = "Allow"
            priority    = 100
            name        = "Azure Devops Pipeline"
        }

        scm_ip_restriction {
            ip_address = var.office_ip_address
            action     = "Allow"
            priority   = 200
            name       = "Office"
        }
    }

    tags = var.tags

    lifecycle {
        ignore_changes = [
            logs,
            connection_string,
            app_settings,
            identity,
            site_config.0.ip_restriction,
            site_config.0.application_stack,
            site_config.0.virtual_application
        ]
    }
}