# init.pp --- Class gai
#
# Copyright (c) 2013 Stefan Moeding
# All rights reserved.
#
# Author:     Stefan Moeding <stm@kill-9.net>
# Time-stamp: <2013-11-24 12:54:54 stm>
#
# Parameters:
# $label
# $precedence
# $scopev4
# $reload
#
# Requires:
#
# Usage:
#
#   class { 'gai': }
#
#
class gai (
  $label      = {},
  $precedence = {},
  $scopev4    = {},
  $reload     = undef,
)
{
  file { '/etc/gai.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('gai/gaiconf.erb'),
  }
}
