class radiodan {
  group { "radiodan":
    ensure => present,
  }

  Package { ensure => "installed" }

  package { "vim": }
  package { "screen": }
  package { "git": }
  package { "build-essential": }
  package { "sqlite3": }
  package { "libsqlite3-dev": }

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
