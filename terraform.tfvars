#======================================================================================
# Libvirt provider configuration
#======================================================================================

# Provider's URI #
libvirt_provider_uri = "qemu:///system"

# Resource pool name #
libvirt_resource_pool_name = "k8s-resource-pool"

# Location where resource pool will be initialized (Path must contain "/" at the end) #
libvirt_resource_pool_location = "/var/lib/libvirt/pools/"

#======================================================================================
# Global virtual machines parameters
#======================================================================================

# Username used to SSH to the VM #
vm_user = "k8s"

# Private SSH key (for VMs) location (example: ~/.ssh/id_rsa) #
vm_ssh_private_key = "~/.ssh/id_rsa"

# Add VMs to SSH known hosts #
vm_ssh_known_hosts = "true"

# Linux distribution that will be used on VMs. Possible values are: [ubuntu, debian, centos] #
vm_distro = "centos"

# Source of linux image. It can be path to an image on host's filesystem or an URL #
# vm_image_source = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64-disk-kvm.img"
vm_image_source = "https://cloud.centos.org/centos/8-stream/x86_64/images/CentOS-Stream-GenericCloud-8-20201217.0.x86_64.qcow2"

# The prefix added to names of VMs #
vm_name_prefix = "k8s"

#======================================================================================
# KVM network configuration
#======================================================================================

# Network name #
network_name = "k8s-network"

# Network interface #
network_interface = "ens3"

# Network virtual bridge #
network_virtual_bridge = "virbr1"

# Network MAC address #
network_mac = "52:54:00:4f:e3:88"

# Network gateway IP address #
network_gateway = "192.168.113.1"

# Network mask #
network_mask = "255.255.255.0"

# Bits used for network mask (example: 255.255.255.0 uses 24 bits for network) #
network_mask_bits = 24


# --- NAT port range --- #

# NAT (Network Address Translation) port start (from port) #
network_nat_port_start = 1024

# NAT port end (to port) #
network_nat_port_end = 65535


# --- DHCP IP range --- #
# DHCP is used as network management protocol.
# VM's IP address is configured as static IP based on it's MAC.
# IP addresses have to be within DHCP IP range, otherwise IP won't be assigned to VM.

# DHCP IP start (from IP) #
network_dhcp_ip_start = "192.168.113.2"

# DHCP IP end (to IP) #
network_dhcp_ip_end = "192.168.113.254"

#======================================================================================
# HAProxy load balancer VMs parameters
#======================================================================================

# The number of vCPU allocated to the load balancer VM #
vm_lb_cpu = 1

# The amount of RAM allocated to the load balancer VM (in Megabytes - MB) #
vm_lb_ram = 2048

# The amount of disk allocated to the load balancer VM (in Bytes - B) #
vm_lb_storage = 16106127360

# MAC and IP addresses for load balancer VMs. #
vm_lb_macs_ips = {
  "52:54:00:00:00:05" = "192.168.113.5"
  "52:54:00:00:00:06" = "192.168.113.6"
}

# The floating virtual IP address. #
# If no load balancers will be installed than vip should point to the master node #
vm_lb_vip = "192.168.113.200"


#======================================================================================
# Master node VMs parameters
#======================================================================================

# The number of vCPU allocated to the master VM #
vm_master_cpu = 2

# The amount of RAM allocated to the master VM (in Megabytes - MB) #
vm_master_ram = 2048

# The amount of disk allocated to the master VM (in Bytes - B) #
vm_master_storage = 16106127360

# MAC and IP addresses for master VMs. It is recommended to have at least 3 masters. #
# Also note that number of masters cannot be divisible by 2. #
vm_master_macs_ips = {
  "52:54:00:00:00:10" = "192.168.113.10"
  "52:54:00:00:00:11" = "192.168.113.11"
  "52:54:00:00:00:12" = "192.168.113.12"
}

#======================================================================================
# Worker node VMs parameters
#======================================================================================

# The number of vCPU allocated to the worker VM #
vm_worker_cpu = 4

# The amount of RAM allocated to the worker VM (in Megabytes - MB) #
vm_worker_ram = 8192

# The amount of disk allocated to the worker VM (in Bytes - B) #
vm_worker_storage = 32212254720

# MAC and IP addresses for worker VMs. #
vm_worker_macs_ips = {
  "52:54:00:00:00:40" = "192.168.113.100"
  "52:54:00:00:00:41" = "192.168.113.101"
  "52:54:00:00:00:42" = "192.168.113.102"
}

# Sets worker node's role label #
vm_worker_node_label = "node"

#======================================================================================
# Kubernetes (k8s) parameters
#======================================================================================

# The Git repository to clone Kubespray from #
k8s_kubespray_url = "https://github.com/kubernetes-sigs/kubespray.git"

# The version of Kubespray that will be used to deploy Kubernetes #
k8s_kubespray_version = "v2.15.0"

# The Kubernetes version that will be deployed #
k8s_version = "v1.19.7"

# The overlay network plugin used by the Kubernetes cluster (flannel/weave/calico/cilium/canal/contiv/kube-router) #
k8s_network_plugin = "calico"

# The DNS service used by Kubernetes cluster (coredns/kubedns)#
k8s_dns_mode = "coredns"
