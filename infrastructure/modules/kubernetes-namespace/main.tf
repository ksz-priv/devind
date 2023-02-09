resource "kubernetes_namespace" "kubernetesnamespace" {
  metadata {

    labels = {
      mylabel = "label-value"
    }

    name = var.namespace_name
  }
}
