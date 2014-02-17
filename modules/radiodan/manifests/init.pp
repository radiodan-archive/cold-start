class radiodan {
  group { "radiodan":
    ensure => present,
  }

  Package { ensure => "installed" }

  package { "vim": }
  package { "git": }
  package { "build-essential": }

  include users
  include ruby
  include nodejs
  include rabbitmq
  include audio
  include network
  include wpa_cli_web
  include dnsmasq
  include nginx
  include default_application
}
