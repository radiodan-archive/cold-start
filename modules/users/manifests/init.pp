class users {
  user { 'pi':
    ensure   => present,
    home     => '/home/pi',
    password => '$6$unnvVux0$PI6kGlFOoI63KLETuB59x9jVZvy1y7DfrTKzHwD4bC/fBeyNqKwiG3Knu8k6vIXV6mLtjA0rKwQBJ18ioE8k20',
    # password => sha1('raspberry'),
    require  => File['/home/pi'],
  }

  file { '/home/pi':
    ensure => directory,
  }
}
