# gai

[![Build Status](https://travis-ci.org/smoeding/puppet-gai.svg?branch=master)](https://travis-ci.org/smoeding/puppet-gai)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What does the module do?](#module-description)
3. [Setup - The basics of getting started with gai](#setup)
	* [What gai affects](#what-gai-affects)
	* [Setup requirements](#setup-requirements)
	* [Beginning with gai](#beginning-with-gai)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Manage `/etc/gai.conf` with Puppet.

## Module description

RFC 3484 provides an algorithm to sort the result of a call to `getaddrinfo(3)` when multiple answers are returned. Especially for hosts connected to an IPv4 and an IPv6 network it might be necessary to modify these static rules. For Linux using the glibc implementation this can be done with the `/etc/gai.conf` configuration file. This module provides a way to manage this file in your environment.

## Setup

Declare the gai class to install an empty configuration enforcing the default rules.

```puppet
class { 'gai': }
```

## Usage

### Modify the precedence rules to prefer IPv4 addresses

```puppet
class { 'gai':
  precedence => {
	'::/96'         => '20',
	'2002::/16'     => '30',
	'::/0'          => '40',
	'::1/128'       => '50',
	'::ffff:0:0/96' => '100',
  }
}
```

There is also a builtin class to achieve this setup.

```puppet
class { 'gai::preferipv4': }
```

## Limitations

This module is only useful on systems using glibc and the `/etc/gai.conf` file. It is therefore probably limited to Linux.

## Development

Feel free to send pull requests for new features. Documentation updates with real world configurations are especially appreciated.
