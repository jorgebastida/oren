class munin {

  package { munin:
    ensure => latest
  }

  file { "/etc/munin/munin.conf":
    owner   => root,
    group   => root,
    mode    => 644,
    source  => 'puppet:///modules/munin/munin.conf',
    require => Package['munin'],
    notify  => Service['munin-node']
  }

  file { "/etc/munin/apache.conf":
    require  => Package["munin"],
    ensure   => absent
  }

  service { 'munin-node':
    ensure      => running,
    enable      => true,
    hasrestart  => true,
    require     => Package['munin']
  }

  # TODO S.M.A.R.T PLUGIN

}
