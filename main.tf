resource "yandex_compute_disk" "boot" {
  name        = lookup(var.boot_disk, "name", null)
  type        = lookup(var.boot_disk, "type", null)
  zone        = lookup(var.boot_disk, "zone", null)
  image_id    = lookup(var.boot_disk, "image_id", null)
  snapshot_id = lookup(var.boot_disk, "snapshot_id", null)
  labels      = lookup(var.boot_disk, "labels", null)
}

resource "yandex_compute_instance" "this" {
  name        = var.name
  zone        = var.zone  
  platform_id = var.platform_id

  allow_stopping_for_update = var.allow_stopping_for_update

  resources {
    cores          = lookup(var.resources, "cores", 2)
    memory         = lookup(var.resources, "memory", 4)
    core_fraction  = lookup(var.resources, "core_fraction", null)
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot.id
  }

  network_interface {
    subnet_id          = data.yandex_vpc_subnet.this.subnet_id
    ip_address         = try(var.ipv4_private_address, null)
    ipv6_address       = try(var.ipv6_private_address, null)
    nat_ip_address     = try(var.nat_public_ip_address, null)
    ipv4               = try(var.allocate_ipv4, true)
    ipv6               = try(var.allocate_ipv6, false)
    nat                = try(var.allocate_nat, false)
    security_group_ids = (var.create_default_security_group && (var.default_security_group_ingress != [] || var.default_security_group_egress != [])) || var.vpc_security_groups != [] ? setunion(try([yandex_vpc_security_group.this[0].id],[]),var.vpc_security_groups) : null

    dynamic "dns_record" {
      for_each    = var.dns_record != {} ? [var.dns_record] : []
      iterator    = record
      content {
        fqdn        = lookup(record.value, "fqdn")
        ttl         = lookup(record.value, "ttl", null)
        ptr         = lookup(record.value, "ptr", false)
        dns_zone_id = data.yandex_dns_zone.dns_zone[0].dns_zone_id
      }
    }

    dynamic "ipv6_dns_record" {
      for_each    = var.ipv6_dns_record != {} ? [var.ipv6_dns_record] : []
      iterator    = record
      content {
        fqdn        = lookup(record.value, "fqdn")
        ttl         = lookup(record.value, "ttl", null)
        ptr         = lookup(record.value, "ptr", false)
        dns_zone_id = data.yandex_dns_zone.ipv6_dns_zone[0].dns_zone_id
      }
    }

    dynamic "nat_dns_record" {
      for_each    = var.nat_dns_record != {} ? [var.nat_dns_record] : []
      iterator    = record
      content {
        fqdn        = lookup(record.value, "fqdn")
        ttl         = lookup(record.value, "ttl", null)
        ptr         = lookup(record.value, "ptr", false)
        dns_zone_id = data.yandex_dns_zone.nat_dns_zone[0].dns_zone_id
      }
    }
  }
  metadata = {
    serial-port-enable = "1"
    user-data          = var.user_data != "" ? var.user_data : data.template_file.this.rendered
  }
}

resource "yandex_vpc_security_group" "this" {
  network_id  = data.yandex_vpc_subnet.this.network_id
  count       = var.create_default_security_group && (var.default_security_group_ingress != [] || var.default_security_group_egress != []) ? 1 : 0
  
  dynamic "ingress" {
    for_each    = { for k, v in var.default_security_group_ingress : k => v }
    iterator    = ingress
    content {
      protocol       = lookup(ingress.value, "protocol", null)
      description    = lookup(ingress.value, "description", null)
      labels         = lookup(ingress.value, "labels", null)
      from_port      = lookup(ingress.value, "from_port", null)
      to_port        = lookup(ingress.value, "to_port", null)
      port           = lookup(ingress.value, "port", null)
      v4_cidr_blocks = lookup(ingress.value, "v4_cidr_blocks", null)
      v6_cidr_blocks = lookup(ingress.value, "v6_cidr_blocks", null)
    }
  }

  dynamic "egress" {
    for_each    = { for k, v in var.default_security_group_egress : k => v }
    iterator    = egress
    content {
      protocol       = lookup(egress.value, "protocol", null)
      description    = lookup(egress.value, "description", null)
      labels         = lookup(egress.value, "labels", null)
      from_port      = lookup(egress.value, "from_port", null)
      to_port        = lookup(egress.value, "to_port", null)
      port           = lookup(egress.value, "port", null)
      v4_cidr_blocks = lookup(egress.value, "v4_cidr_blocks", null)
      v6_cidr_blocks = lookup(egress.value, "v6_cidr_blocks", null)
    }
  }
}
