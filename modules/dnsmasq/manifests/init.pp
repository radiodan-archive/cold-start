class dnsmasq {
  package {'dnsmasq':
    ensure => installed,
  }

  file {'/etc/dnsmasq.conf':
    content => "
address=/#/raspberrypi.local
interface=wlan0
dhcp-range=10.0.0.2,10.0.0.20,1m
    ",
    mode => 755,
  }

  service {'dnsmasq':
    ensure => stopped,
    enable => true,
    require => [Package["dnsmasq"], File["/etc/dnsmasq.conf"]],
  }
}
