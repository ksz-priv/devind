owner       = "ksz"
environment = "dev"
project     = "devind"
location    = "West Europe"

kubernetes_network = {
  network_profile = {
    network_plugin = "azure"
    network_policy = "calico"
  }

  api_server_access_profile = {
    authorized_ip_ranges = ["188.117.157.11/24"]
  }
}
