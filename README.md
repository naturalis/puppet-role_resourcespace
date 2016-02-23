puppet-role_resourcespace
===================

Puppet role definition for deployment of resourcespace

Parameters
-------------
Sensible defaults for Naturalis in init.pp, extra_users_hash for additional SSH users that are allowed root permissions and webusers_hash for users allowed login permissions and edit docroot permissions.  

```
  docroot              = documentroot
  webdirs              = Array with webdirectories, 0770 permissions will be applied owner: www-data  group: www-data
  rwwebdirs            = Array with webdirectories that need read and write permissions, starting at the highest path, 0777 permissions will be applied owner: www-data  group: www-data
  enable_mysql         = when set to true a mysql server will be installed
  mysql_root_password  = Mysql Root password
  instances            = Instance hash, see the default for parameters
```


Classes
-------------
- role_resourcespace
- role_resourcespace::instances


Dependencies
-------------
- puppetlabs/mysql
- puppetlabs/apache
- puppetlabs/concat
- thias/php


Puppet code
```
class { role_resourcespace: }
```
Result
-------------
Working Linux Apache (Mysql) PHP installation


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


Authors
-------------
Author Name <hugo.vanduijn@naturalis.nl>

