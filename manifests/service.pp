# @summary Keep the unbound service running
#
class unbound::service (
    String $service_name,
) {

  service { $service_name:
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
