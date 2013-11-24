# init.pp --- Manage /etc/gai.conf
#
# Copyright (c) 2013 Stefan Moeding
# All rights reserved.
#
# Author:     Stefan Moeding <stm@kill-9.net>
# Time-stamp: <2013-11-24 19:36:36 stm>
#
# Parameters:
# $label      hash with netmask => precedence pairs for the label table
# $precedence hash with netmask => precedence pairs for the precedence table
# $scopev4    hash with mask    => value pairs for the scope table
# $reload     'yes' or 'no' to indicate if the config should be reloaded
#             for every lookup
#
# Requires:
#
# Usage:
#
#   class { 'gai':
#     precedence => {
#       '::/96'         => '20',
#       '2002::/16'     => '30',
#       '::/0'          => '40',
#       '::1/128'       => '50',
#       '::ffff:0:0/96' => '100',
#     }
#   }
#
class gai ($label = {}, $precedence = {}, $scopev4 = {}, $reload = undef) {
  #
  # Declaring the class without any parameters will create the file
  # /etc/gai.conf containing comments only. In this case the operating
  # system specific default rules apply. See RFC 3484 for details.
  #
  file { '/etc/gai.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('gai/gaiconf.erb'),
  }
}
