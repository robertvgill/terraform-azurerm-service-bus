output "sb_servicebus_namespace" {
  value = azurerm_servicebus_namespace.namespace
}

output "sb_queues" {
  value = azurerm_servicebus_queue.queue
}

output "sb_topics" {
  value = azurerm_servicebus_topic.topic
}

output "sb_subscriptions" {
  value = azurerm_servicebus_subscription.subscription
}
