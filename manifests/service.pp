# @summary Keep the unbound service running
#
class unbound::service {

  service { 'unbound':
    ensure => running,
    enable => true,
    hasstatus => true,
    hasrestart => true,
    subscribe => [
		   File['/etc/resolv.conf'],
		   File['/etc/unbound/conf.d/unbound.conf'],
		 ]

  }

}
