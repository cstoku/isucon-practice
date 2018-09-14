data sakuracloud_archive "isucon_bench" {
  name_selectors = ["Ubuntu", "16.04", "LTS"]
}

resource sakuracloud_disk "isucon_bench" {
  name      = "isucon-bench"
  source_archive_id = "${data.sakuracloud_archive.isucon_bench.id}"

  lifecycle {
    ignore_changes = ["source_archive_id"] 
  }
}

resource sakuracloud_server "isucon_bench" {
  name  = "isucon-bench"
  disks = ["${sakuracloud_disk.isucon_bench.id}"]

  core      = 1
  memory    = 1

  additional_nics   = ["${sakuracloud_switch.isucon_switch.id}"]

  hostname  = "isucon-bench"
  password  = "isucon7-final"
}


