output "client_certificate1" {
  value     = azurerm_kubernetes_cluster.akscluster.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.akscluster.kube_config_raw

  sensitive = true
}

output "kubernetes_host" {
  value = azurerm_kubernetes_cluster.akscluster.kube_config.0.host
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.akscluster.kube_config.0.client_certificate
}

output "client_key" {
  value = azurerm_kubernetes_cluster.akscluster.kube_config.0.client_key
}

output "cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.akscluster.kube_config.0.cluster_ca_certificate
}
