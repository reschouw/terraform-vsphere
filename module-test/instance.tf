# Terraform 0.13 will include support for using for_each and count with modules
# but until it's out of public beta, multiple copies of the same code are required

module "module-test-1" {
  source = "../modules/vsphere-instance"

  hostname = "module-test-1"
  ip-address = "192.168.1.233/24"
  gateway = "192.168.1.1"
  dns-servers = "192.168.1.11, 192.168.1.12"
  num-cpus = 2
  memory = 2048
  disk-size = 8
  template = "ubuntu-18-04-20200709140801"
}

module "module-test-2" {
  source = "../modules/vsphere-instance"

  hostname = "module-test-2"
  ip-address = "192.168.1.234/24"
  gateway = "192.168.1.1"
  dns-servers = "192.168.1.11, 192.168.1.12"
  num-cpus = 2
  memory = 2048
  disk-size = 8
  template = "ubuntu-18-04-20200709140801"
}
