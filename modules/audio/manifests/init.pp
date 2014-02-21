class audio {
  package { "mpd": }
  package { "mpc": }
  package { "ncmpcpp": }
  package { "alsa-utils": }

  service { "mpd":
    ensure => "stopped",
    enable => false,
    require => Package['mpd'],
  }

  file { "/music":
    ensure => "directory",
    owner  => "mpd",
    group  => "radiodan",
    mode   => 777,
    require => Group['radiodan']
  }

  file { "/playlists":
    ensure => "directory",
    owner  => "mpd",
    group  => "radiodan",
    mode   => 777,
    require => Group['radiodan']
  }

  file { '/etc/mpd.conf':
    ensure  => present,
    require => Package['mpd'],
    notify => Service['mpd'],
    content => '
music_directory    "/music"
playlist_directory "/playlists"
db_file            "/var/lib/mpd/tag_cache"
log_file           "/var/log/mpd/mpd.log"
pid_file           "/var/run/mpd/pid"
user               "mpd"
bind_to_address    "localhost"
port               "6600"
auto_update        "yes"

audio_output {
        type            "alsa"
        name            "Speakers"
        device          "hw:0,0"
        format          "44100:16:2"
        mixer_type      "software"
}

audio_output {
        type            "httpd"
        name            "Web Stream"
        encoder         "lame"
        port            "8000"
        bind_to_address "0.0.0.0"
        bitrate         "128"
        format          "44100:16:1"
        max_clients     "0"
}
',
  }
}
