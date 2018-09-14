data sakuracloud_archive "isucon_app" {
  name_selectors = ["Ubuntu", "16.04", "LTS"]
}

resource sakuracloud_disk "isucon_app" {
  count = "${var.server_num}"

  name      = "isucon-app${format("%02d", count.index + 1)}"
  source_archive_id = "${data.sakuracloud_archive.isucon_app.id}"

  lifecycle {
    ignore_changes = ["source_archive_id"] 
  }
}

resource sakuracloud_server "isucon_app" {
  count = "${var.server_num}"

  name  = "isucon-app${format("%02d", count.index + 1)}"
  disks = ["${element(sakuracloud_disk.isucon_app.*.id, count.index)}"]

  core      = 2
  memory    = 2

  additional_nics   = ["${sakuracloud_switch.isucon_switch.id}"]

  hostname  = "isucon-app${format("%02d", count.index + 1)}"
  password  = "isucon7-final"
}

