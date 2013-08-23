class dnsmasq {
  package {'dnsmasq':
    ensure => installed,
  }

  file {'/etc/dnsmasq.conf':
    content => "
address=/#/10.0.0.200
interface=wlan0
dhcp-range=10.0.0.2,10.0.0.20,12h
    ",
    mode => 755,
  }

  service {'dnsmasq':
    ensure => stopped,
    enable => true,
    require => [Package["dnsmasq"], File["/etc/dnsmasq.conf"]],
  }
}
