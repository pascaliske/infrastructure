output "talos_client_configuration" {
  value     = try(data.talos_client_configuration.this.talos_config)
  sensitive = true
}

output "talos_kubeconfig" {
  value     = try(talos_cluster_kubeconfig.this.kubeconfig_raw)
  sensitive = true
}
