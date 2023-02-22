data "digitalocean_vpc" "default" {
  name = var.vpc-name
}

resource "digitalocean_kubernetes_cluster" "kubernetes" {
  name         = var.kubernetes-cluster-name
  region       = var.region
  vpc_uuid     = data.digitalocean_vpc.default.id
  auto_upgrade = true
  version      = "1.25.4-do.0" # Get latest version(s) with: doctl kubernetes options versions

  node_pool {
    name       = "autoscale-worker-pool"
    size       = "s-2vcpu-2gb"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 3
  }
}

resource "local_sensitive_file" "kubernetes_config" {
  content  = "${digitalocean_kubernetes_cluster.kubernetes.kube_config.0.raw_config}"
  filename = "${path.module}/files/kubeconfig.yaml"
} 

output "z_connect_to_k8s" {
  value = <<EOT

    # How to connect to the Kubernetes service:

      # Connect to the Kubernetes service with:
          export KUBECONFIG=files/kubeconfig.yaml
          kubectl cluster-info
          kubectl get all

    # How to connect to the dashboards:
    
      Kubernetes: See README.md
      Prometheus: See README.md
      Grafana:    See README.md
EOT
}