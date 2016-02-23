puppet-role_resourcespace
===================

Puppet role definition for deployment of resourcespace

Parameters
-------------
Sensible defaults for Naturalis in init.pp

```
  See init.pp for defaults and variables
```


Classes
-------------
- role_resourcespace
- role_resourcespace::instances
- role_resourcespace::treebase

Dependencies
-------------
- puppetlabs/mysql
- puppetlabs/apache
- puppetlabs/concat
- puppetlabs/vcsrepo
- thias/php


Puppet code
```
class { role_resourcespace: }
```
Result
-------------
Working Linux Apache (Mysql) PHP installation customized for resource space including resourcespace buildscript in /opt 
buildscript is run once during deployment. All defaults includes encryption + certificates by letsencrypt. 


Limitations
-------------
This module has been built on and tested against Puppet 3 and higher.

The module has been tested on:
- Ubuntu 14.04LTS

Dependencies releases tested: 
- puppetlabs/mysql 3.3.0
- puppetlabs/apache 1.3.0
- puppetlabs/concat 1.2.0
- thias/php 1.0.0
- puppetlabs/vcsrepo
