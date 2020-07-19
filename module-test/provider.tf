provider "vsphere" {
  user           = "administrator@dorwinia.com"
  password       = "getyourownverysecurepassword"
  vsphere_server = "vcenter.dorwinia.com"
  version = "~> 1.18.3"
  # If you have a self-signed cert
  allow_unverified_ssl = true
}
