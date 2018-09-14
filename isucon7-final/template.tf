data "template_file" "ansible_inventory" {
  template = "${file("inventory.tpl")}"

  vars {
    isucon_bench_address     = "${sakuracloud_server.isucon_bench.ipaddress}"
    isucon_app01_address  = "${sakuracloud_server.isucon_app.*.ipaddress[0]}"
    isucon_app02_address  = "${sakuracloud_server.isucon_app.*.ipaddress[1]}"
    isucon_app03_address  = "${sakuracloud_server.isucon_app.*.ipaddress[2]}"
    isucon_app04_address  = "${sakuracloud_server.isucon_app.*.ipaddress[3]}"
  }
}

resource "local_file" "ansible_inventory" {
  content   = "${data.template_file.ansible_inventory.rendered}"
  filename  = "ansible/inventory"

  provisioner "local-exec" {
    working_dir = "ansible"
    command = "ansible-playbook all.yml"
  }
}
