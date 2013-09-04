class ruby {
  package { "ruby1.9.3": }

  package { 'bundler':
    provider => 'gem',
    require => Package['ruby1.9.3'],
  }

  package { 'foreman-export-initscript':
    provider => 'gem',
    require => Package['ruby1.9.3'],
  }
}
