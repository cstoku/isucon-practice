[bench]
isucon-bench    ansible_host=${isucon_bench_address}

[web]
isucon-app01 ansible_host=${isucon_app01_address}
isucon-app02 ansible_host=${isucon_app02_address}
isucon-app03 ansible_host=${isucon_app03_address}

[db]
isucon-app04 ansible_host=${isucon_app04_address}

[server:children]
web
db

