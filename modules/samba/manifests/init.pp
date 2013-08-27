class samba {
  package { "samba": }
  package { "samba-common-bin": }

  service { "samba":
    ensure => "running",
    require => Package['samba'],
  }

  file { "/var/radiodan":
    ensure => "directory",
  }

  file { "/var/radiodan/rapps":
    ensure => "directory",
    require => File['/var/radiodan'],
  }

  file { "/etc/samba/smb.conf":
    content => template("samba/config"),
    notify => Service['samba'],
  }
}
