# puppet-gai

Manage `/etc/gai.conf` with Puppet.

RFC 3484 provides an algorithm to sort the result of a call to `getaddrinfo(3)` when multiple answers are returned. Especially for hosts connected to an IPv4 and an IPv6 network it might be necessary to modify these static rules. For Linux using the glibc implementation this can be done with the `/etc/gai.conf` configuration file.

## Usage

### Create an empty configuration enforcing the default rules

```Puppet
class { 'gai': }
```

### Modify the precedence rules to prefer IPv4 addresses

```Puppet
class { 'gai':
  precedence        => {
    '::/96'         => '20',
    '2002::/16'     => '30',
    '::/0'          => '40',
    '::1/128'       => '50',
    '::ffff:0:0/96' => '100',
  }
}
```

There is also a builtin class to achieve this:

```Puppet
class { 'gai::preferipv4': }
```
