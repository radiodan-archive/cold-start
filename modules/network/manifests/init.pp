class network {
  package {'avahi-daemon': }
  package {'isc-dhcp-server': }

  service { "isc-dhcp-server":
    enable => false,
    ensure => 'stopped',
    require => Package['isc-dhcp-server']
  }

  file { "/etc/network/interfaces":
    content => template("network/interfaces"),
  }
  file { "/etc/dhcp/dhcpd.conf":
    content => template("network/dhcpd_conf"),
    require => Package['isc-dhcp-server']
  }
  file { "/etc/default/isc-dhcp-server":
    content => template("network/isc_dhcp_server"),
    require => Package['isc-dhcp-server']
  }
  file { "/etc/rc.local":
    content => template("network/rc_local"),
    mode => '700',
  }
  file { "/usr/local/bin/try_adhoc_network":
    content => template("network/try_adhoc_network"),
    mode => '700',
  }
  file { "/etc/wpa_supplicant/wpa_supplicant.conf":
    content => template("network/wpa_supplicant_conf"),
  }
}
