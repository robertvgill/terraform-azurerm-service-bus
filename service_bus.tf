resource "azurerm_servicebus_namespace" "namespace" {
  count               = var.sb_servicebus_create ? 1 : 0

  resource_group_name = var.rg_resource_group_name
  location            = var.rg_location

  name                = format("%s", var.sb_namespace_name)
  sku                 = var.sb_namespace_sku
  capacity            = var.sb_namespace_capacity
  zone_redundant      = var.sb_namespace_sku == "premium" ? var.sb_redundency : false

  tags     = merge({ "ResourceName" = format("%s", var.sb_namespace_name) }, var.tags, )
}

resource "azurerm_servicebus_queue" "queue" {
  count               = var.sb_servicebus_create && var.sb_namespace_sku != "basic" ? 1 : 0
  depends_on          = [azurerm_servicebus_namespace.namespace]

  name                = element(var.sb_queues, count.index)
  resource_group_name = var.rg_resource_group_name
  namespace_name      = format("%s", var.sb_namespace_name)
}

resource "azurerm_servicebus_topic" "topic" {
  count               = var.sb_servicebus_create && var.sb_namespace_sku != "basic" ? 1 : 0
  depends_on          = [azurerm_servicebus_namespace.namespace]

  name                = element(var.sb_topics, count.index)
  resource_group_name = var.rg_resource_group_name
  namespace_name      = format("%s", var.sb_namespace_name)
}

resource "azurerm_servicebus_subscription" "subscription" {
  count               = var.sb_servicebus_create && var.sb_namespace_sku != "basic" ? 1 : 0
  depends_on          = [azurerm_servicebus_namespace.namespace]

  name                = "${element(azurerm_servicebus_topic.topic.*.name, count.index)}-sub"
  resource_group_name = var.rg_resource_group_name
  namespace_name      = format("%s", var.sb_namespace_name)
  topic_name          = element(azurerm_servicebus_topic.topic.*.name, count.index)
  max_delivery_count  = var.sb_servicebus_subscription_max_delivery_count
}
