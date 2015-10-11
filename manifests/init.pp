# = Class: gai
#
# Manage /etc/gai.conf
#
# == Parameters:
#
# [*label*]
#   A hash with netmask/precedence pairs for the label table.
#
# [*precedence*]
#   A hash with netmask/precedence pairs for the precedence table.
#
# [*scopev4*]
#   A hash with mask/value pairs for the scope table.
#
# [*reload*]
#   Indicate if the config should be reloaded for every loopkup.
#   Valid options: 'yes', 'no' od undefined. Default: undef
#
# == Requires:
#
# Nothing.
#
# == Sample Usage:
#
#   class { 'gai': }
#
#
class gai (
  $label      = {},
  $precedence = {},
  $scopev4    = {},
  $reload     = undef,
) {

  # Declaring the class without any parameters will create the file
  # /etc/gai.conf containing comments only. In this case the operating
  # system specific default rules apply. See RFC 3484 for details.

  file { '/etc/gai.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('gai/gaiconf.erb'),
  }
}
