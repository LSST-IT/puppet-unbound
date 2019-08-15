# @summary unbound::resolv
class unbound::resolv {

  file { '/etc/resolv.conf':
    content => epp( "unbound/resolv.conf.epp" ),
    ensure => 'file',
    owner => 'root',
    group => 'root',
    mode => '644',
  }

}
