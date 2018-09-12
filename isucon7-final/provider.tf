
provider "sakuracloud" {
  token  = "${var.sakuracloud_token}"
  secret =  "${var.sakuracloud_secret}"
  zone   =  "${var.sakuracloud_zone}"
}
