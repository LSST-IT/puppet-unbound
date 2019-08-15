# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   Do not include this class directly
class unbound::install (
    Array[String,1] $pkg_list,
    String          $ensure,
) {

  ensure_packages( $pkg_list, {'ensure' => $ensure} )

}
