node basenode {

  package {'tzdata':
    ensure => installed
  }

  package { 'traceroute':
    ensure => installed
  }

  package { 'curl':
    ensure => installed
  }

  package { 'vim':
    ensure => installed
  }

  file { '/etc/localtime':
    require => Package['tzdata'],
    ensure  => 'file:///usr/share/zoneinfo/Europe/London',
    notify  => Exec['Update dpkg-reconfigure tzdata']
  }

  file {'/etc/timezone':
    content => 'Europe/Madrid\n',
    notify  => Exec['Update dpkg-reconfigure tzdata']
  }

  exec { 'Update dpkg-reconfigure tzdata':
    path        => '/usr/bin:/usr/sbin/:/bin:/sbin',
    command     => 'dpkg-reconfigure -f noninteractive tzdata',
    refreshonly => true
  }

  file { '/etc/default/locale':
    content => "LANG='en_GB.UTF-8'\nLANGUAGE='en_GB:en'\n"
  }

}
