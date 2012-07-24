class samba {

  package { "samba":
    ensure => latest
  }

  package { "samba-common":
    ensure => latest
  }

  file { "/etc/samba/smb.conf":
    owner   => root,
    group   => root,
    mode    => 644,
    source  => 'puppet:///modules/samba/smb.conf',
    require => Package['samba'],
    notify  => Service['smbd']
  }

  service { 'smbd':
    ensure      => running,
    enable      => true,
    hasrestart  => true,
    require     => Package['samba']
  }

}
