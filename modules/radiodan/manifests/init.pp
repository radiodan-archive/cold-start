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

  include ruby
  include audio
  include network
  include wpa_cli_web
  include dnsmasq
  include nginx
}
