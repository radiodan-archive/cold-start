class default_application {
  exec { "radiodan_example.tar.gz":
    path => "/usr/bin",
    command => "wget https://github.com/radiodan/radiodan_example/archive/master.tar.gz -O /tmp/radiodan_example.tar.gz",
    creates => "/tmp/radiodan_example.tar.gz"
  }

  exec { "tar -xzf /tmp/radiodan_example.tar.gz":
    user    => "pi",
    cwd     => "/home/pi/apps",
    creates => "/home/pi/apps/radiodan_example-master",
    path    => ["/bin", "/usr/bin", "/usr/sbin"],
    require => [Exec["radiodan_example.tar.gz"], File["/home/pi/apps"]]
  }

  file { "/home/pi/apps":
    ensure => directory,
    owner => "pi",
    group => "pi",
    mode => 750,
    recurse => true,
  }

  file { "/usr/local/bin/install_apps":
    ensure => present,
    owner => "root",
    group => "staff",
    mode => 770,
    content => template("default_application/install_apps"),
  }
}
