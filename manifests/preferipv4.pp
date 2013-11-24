# preferipv4.pp --- Class gai::preferipv4
#
# Copyright (c) 2013 Stefan Moeding
# All rights reserved.
#
# Author:     Stefan Moeding <stm@kill-9.net>
# Time-stamp: <2013-11-24 12:21:04 stm>
#
# Parameters:
#
# Requires:
#
# Usage:
#
#   class { 'gai::preferipv4': }
#
#
class gai::preferipv4 {
  class { 'gai':
    # Redefine precedence table to prefer IPv4 addresses
    precedence        => {
      '::/96'         => '20',
      '2002::/16'     => '30',
      '::/0'          => '40',
      '::1/128'       => '50',
      '::ffff:0:0/96' => '100',
    }
  }
}
