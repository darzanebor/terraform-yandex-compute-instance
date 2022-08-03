data "yandex_dns_zone" "dns_zone" {
  count = var.dns_record != {} ? 1 : 0
  name  = var.dns_record["zone_name"]
}

data "yandex_dns_zone" "ipv6_dns_zone" {
  count = var.ipv6_dns_record != {} ? 1 : 0
  name  = var.ipv6_dns_record["zone_name"]
}

data "yandex_dns_zone" "nat_dns_zone" {
  count = var.nat_dns_record != {} ? 1 : 0
  name  = var.nat_dns_record["zone_name"]
}

data "yandex_vpc_subnet" "this" {
  name = var.vpc_subnet_name
}

data "template_file" "this" {
  template = file("${path.module}/files/cloud-config")

  vars = {
    username    = var.username
    password    = var.password
    ssh_key     = var.ssh_key
    user_groups = var.user_groups
  }
}
