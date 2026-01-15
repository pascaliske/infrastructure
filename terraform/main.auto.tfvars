# --- talos specific values

talos_version = "v1.11.3"

talos_kubernetes_version = "v1.33.0"

talos_schematic = <<-EOS
  customization:
    systemExtensions:
      officialExtensions:
        - siderolabs/ctr
        - siderolabs/iscsi-tools
        - siderolabs/qemu-guest-agent
        - siderolabs/util-linux-tools
EOS

# --- network values

network_gateway = "10.0.2.1"

network_ipv4_prefix = "10.0.2.2%s"

network_dns_server = "10.0.2.1"

network_dns_domain = "iske.cloud"

# --- cluster values

cluster_name = "talos"

cluster_endpoint = "cluster.iske.cloud"

cluster_vip = "10.0.2.20"

# --- control plane specific values

control_plane_prefix = "talos-control-plane-0"

control_plane_count = 3

control_plane_cores = 2

control_plane_memory = 6144

control_plane_storage = 50

# --- worker specific values

worker_prefix = "talos-worker-0"

worker_count = 3

worker_cores = 2

worker_memory = 12288

worker_storage = 200

# --- gitlab specific values

gitlab_cores = 2

gitlab_memory = 4096

gitlab_storage = 50

gitlab_ipv4_address = "10.0.2.12/24"
