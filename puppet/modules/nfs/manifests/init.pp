class nfs {

  package { "nfs-kernel-server":
    ensure => latest
  }

  service { 'nfs-kernel-server':
    ensure      => running,
    enable      => true,
    hasrestart  => true,
    require     => Package['nfs-kernel-server']
  }

}
