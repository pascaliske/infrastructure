output "talos_client_configuration" {
  value     = try(data.talos_client_configuration.this.talos_config)
  sensitive = true
}

output "talos_machine_configuration_control_plane" {
  value     = try(data.talos_machine_configuration.control_plane.machine_configuration)
  sensitive = true
}

output "talos_machine_configuration_worker" {
  value     = try(data.talos_machine_configuration.worker.machine_configuration)
  sensitive = true
}

output "talos_kubeconfig" {
  value     = try(talos_cluster_kubeconfig.this.kubeconfig_raw)
  sensitive = true
}
