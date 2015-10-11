# = Class: gai::preferipv4
#
# Define precedence table in /etc/gai.conf to prefer IPv4
#
# == Parameters:
#
# None.
#
# == Requires:
#
# Nothing.
#
# == Sample Usage:
#
#   class { 'gai::preferipv4': }
#
#
class gai::preferipv4 {

  # Redefine precedence table to prefer IPv4 addresses

  class { '::gai':
    precedence => {
      '::/96'         => '20',
      '2002::/16'     => '30',
      '::/0'          => '40',
      '::1/128'       => '50',
      '::ffff:0:0/96' => '100',
    }
  }
}
