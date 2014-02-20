class users {
  user { 'radiodan':
    ensure    => present,
    home      => '/home/radiodan',
    password  => sha1('radiodan'),
    #password => '$6$unnvVux0$PI6kGlFOoI63KLETuB59x9jVZvy1y7DfrTKzHwD4bC/fBeyNqKwiG3Knu8k6vIXV6mLtjA0rKwQBJ18ioE8k20',
    shell     => "/bin/bash",
    groups    => 'audio',
    require   => File['/home/radiodan/.ssh/authorized_keys'],
  }

  file { '/home/radiodan':
    ensure => directory,
  }

  file { '/home/radiodan/.ssh':
    ensure  => directory,
    require => File['/home/radiodan'],
  }

  file { '/home/radiodan/.ssh/authorized_keys':
    content => "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key",
  }
}
