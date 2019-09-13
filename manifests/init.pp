# @summary unbound
#
# Based on work by Bill Glick; adapted by Jake Rundall.
# @param $log_file           #   e.g., '/var/log/unbound.log'
# @param $local_domain       # (optional) single domain, e.g., 'yahoo.com', or 'none' for none
# @param $search_domains     # array of domains, e.g., 'google.com'
# @param $forward_servers    # servers that Unbound will forward to
#   array of hashes of the form
#   { server => '<ip address>', comment => '<comment>'},
# @param $backup_dns_servers # array of hashes of the form
#   { server => '<ip address>', comment => '<comment>'},
#   only the first two will be considered; any more will be ignored
#   as the max num of nameserver entries for resolv.conf
#   is currently 3 and the first will be Unbound on the local server;
#   see http://man7.org/linux/man-pages/man5/resolv.conf.5.html
# @param $reverse_overrides   
#
# @example
#   include unbound
class unbound (

  String                           $log_file,
  String                           $local_domain,
  Array[ String ]                  $search_domains,
  Array[ Hash ]                    $forward_servers,
  Array[ Hash, 0, 2 ]              $backup_dns_servers,
  Array[ Array[ String[ 1 ] ], 2 ] $reverse_overrides,   

)
{
  contain unbound::install
  contain unbound::config
  contain unbound::resolv
  contain unbound::service
}
