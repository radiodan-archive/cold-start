# We have to manually run the smbpasswd command
# to create a samba password for the pi user
#    $ sudo smbpasswd -a pi
#
class samba {
  package { "samba": }
  package { "samba-common-bin": }

  service { "samba":
    ensure => "running",
    require => Package['samba'],
  }

  file { "/etc/samba/smb.conf":
    content => template("samba/config"),
    notify => Service['samba'],
  }
}
