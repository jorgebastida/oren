class nginx {

  package { "nginx":
    ensure => latest
  }

  file { "/etc/nginx/sites-enabled/munin.conf":
    owner   => root,
    group   => root,
    mode    => 644,
    source  => 'puppet:///modules/nginx/munin.conf',
    require => Package['nginx'],
    notify  => Service['nginx']
  }

  file { "/etc/nginx/sites-enabled/warehouse.conf":
    owner   => root,
    group   => root,
    mode    => 644,
    source  => 'puppet:///modules/nginx/warehouse.conf',
    require => Package['nginx'],
    notify  => Service['nginx']
  }

  service { 'nginx':
    ensure      => running,
    enable      => true,
    hasrestart  => true,
    require     => Package['nginx']
  }

}
