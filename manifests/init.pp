# == Class: role_resourcespace
#
#
# === Authors
#
# Author Name <hugo.vanduijn@naturalis.nl>
#
#
class role_resourcespace (
  $docroot                                = '/var/www/resourcespace',
  $mysql_root_password                    = 'rootpassword',
  $mysql_password                         = 'password',
  $instances                              =
          {'site.resourcespacesite.nl' => {
            'serveraliases'   => '*.resourcespacesite.nl',
            'docroot'         => '/var/www/resourcespace',
            'directories'     => [{ 'path' => '/var/www/resourcespace', 'options' => '-Indexes +FollowSymLinks +MultiViews', 'allow_override' => 'All' }],
            'port'            => 80,
            'serveradmin'     => 'webmaster@naturalis.nl',
            'priority'        => 10,
            },
          },
  $keepalive                            = 'Off',
  $max_keepalive_requests               = '100',
  $keepalive_timeout                    = '15',
  $php_memory_limit                     = '200M',
  $upload_max_filesize                  = '100M',
  $post_max_size                        = '100M'.
  $max_execution_time                   = '30',
  $max_input_time                       = '60',
  $SecFilterEngine                      = 'Off',
  $SecFilterScanPOST                    = 'Off',
  $short_open_tag                       = 'Off', 
  $packages                             = ['subversion','imagemagick','ghostscript','antiword','xpdf','libav-tools','libimage-exiftool-perl'],
){

# install packages
  package { $packages:
    ensure  => 'installed'
  }

# install php module php-gd
  php::module { [ 'gd','mysql','curl', 'dev' ]: }

# customize php.ini
  php::ini { '/etc/php5/apache2/php.ini':
    memory_limit              => $php_memory_limit,
    upload_max_filesize       => $upload_max_filesize,
    post_max_size             => $post_max_size,
    max_execution_time        => $max_execution_time,
    max_input_time            => $max_input_time,
    SecFilterEngine           => $SecFilterEngine,
    SecFilterScanPOST         => $SecFilterScanPOST,
    short_open_tag            => $short_open_tag, 
    require                   => Class['apache']
  }

# Install apache and enable modules
  class { 'apache':
    default_mods              => true,
    mpm_module                => 'prefork',
    keepalive                 => $keepalive,
    max_keepalive_requests    => $max_keepalive_requests,
    keepalive_timeout         => $keepalive_timeout,
  }

  include apache::mod::php
  include apache::mod::rewrite
  include apache::mod::speling

# Create instances (vhosts)
  class { 'role_resourcespace::instances':
      instances               => $instances,
  }

# Configure MySQL Security and finetuning if needed
  if $enable_mysql {
    class { 'mysql::server::account_security':}
    class { 'mysql::server':
        root_password         => $mysql_root_password,
        service_enabled       => true,
        service_manage        => true,
    }
  }

# Create resourcespace database
  mysql::db { 'resourcespace':
    user           => 'resourcespace',
    password       => $mysql_password,
    host           => 'localhost',
    grant          => ['ALL'],
  }

# Create buildscript.sh file
  file { "/opt/buildscript.sh":
    ensure      => present,
    content     =>  template('role_resourcespace/buildscript.sh.erb'),
    owner       => 'root',
    group       => 'root',
    mode        => '0700',
  }

# Create daily cronjob
  cron { 'copy hitcount':
    command => "/usr/sbin/wget -q -r http://localhost/pages/tools/cron_copy_hitcount.php",
    user    => root,
    hour    => 2,
    minute  => 0
  }

}
