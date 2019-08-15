# @summary unbound::config
#
class unbound::config {

  # CONFIGURE UNBOUND SERVICE 

  file { '/etc/unbound/conf.d/unbound.conf':
    content => epp( "unbound/unbound.conf.epp" ),
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '644',
    require => Package['unbound'],
  }

  file { "$unbound::log_file":
    ensure => file,
    owner => 'unbound',
    group => 'unbound',
    mode => '644',
    require => Package['unbound'],
  } 

}
