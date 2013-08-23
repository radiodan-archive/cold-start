class dnsmasq {
  package {'dnsmasq':
    ensure => installed,
  }

  file {'/etc/dnsmasq.conf':
    content => "
address=/#/raspberrypi.local
interface=wlan0
    ",
    mode => 755,
  }

  service {'dnsmasq':
    ensure => stopped,
    enable => true,
    require => [Package["dnsmasq"], File["/etc/dnsmasq.conf"]],
  }
}
