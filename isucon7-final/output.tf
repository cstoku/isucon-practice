output "isucon_bench_address" {
  value = "${sakuracloud_server.isucon_bench.ipaddress}"
}

output "isucon_app01_address" {
  value = "${sakuracloud_server.isucon_app.*.ipaddress[0]}"
}

output "isucon_app02_address" {
  value = "${sakuracloud_server.isucon_app.*.ipaddress[1]}"
}

output "isucon_app03_address" {
  value = "${sakuracloud_server.isucon_app.*.ipaddress[2]}"
}

output "isucon_app04_address" {
  value = "${sakuracloud_server.isucon_app.*.ipaddress[3]}"
}

