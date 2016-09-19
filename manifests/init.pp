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
  $hostname                               = 'rs.naturalis.nl',
  $letsencrypt                            = true,
  $letsencrypt_path                       = '/opt/letsencrypt',
  $letsencrypt_repo                       = 'git://github.com/letsencrypt/letsencrypt.git',
  $letsencrypt_version                    = 'master',
  $letsencrypt_live                       = '/etc/letsencrypt/live/rs.naturalis.nl/cert.pem',
  $letsencrypt_email                      = 'aut@naturalis.nl',
  $letsencrypt_domain                     = 'rs.naturalis.nl',
  $letsencrypt_server                     = 'https://acme-v01.api.letsencrypt.org/directory',
  $instances                              =
          {'rs.naturalis.nl-nonssl' => {
                 'serveraliases'        => '*.naturalis.nl',
                 'docroot'              => '/var/www/resourcespace',
                 'directories'          => [{ 'path' => '/var/www/resourcespace',
                 'options'              => '-Indexes +FollowSymLinks +MultiViews',
                 'allow_override'       => 'All'}],
                 'rewrites'             => [{'rewrite_rule' => ['^/?(.*) https://%{SERVER_NAME}/$1 [R,L]']}],
                 'port'                 => 80,
                 'serveradmin'          => 'aut@naturalis.nl',
                 'priority'             => 10,
             },
           'rs.naturalis.nl' => {
                 'serveraliases'        => '*.naturalis.nl',
                 'docroot'              => '/var/www/resourcespace',
                 'directories'          => [{ 'path' => '/var/www/resourcespace', 'options' => '-Indexes +FollowSymLinks +MultiViews', 'allow_override' => 'All' }],
                 'port'                 => 443,
                 'serveradmin'          => 'webmaster@naturalis.nl',
                 'priority'             => 10,
                 'ssl'                  => true,
                 'ssl_cert'             => '/etc/letsencrypt/live/rs.naturalis.nl/cert.pem',
                 'ssl_key'              => '/etc/letsencrypt/live/rs.naturalis.nl/privkey.pem',
                 'ssl_chain'            => '/etc/letsencrypt/live/rs.naturalis.nl/chain.pem',
                 'additional_includes'  => '/etc/letsencrypt/options-ssl-apache.conf',
            },
          },
  $keepalive                            = 'Off',
  $max_keepalive_requests               = '100',
  $keepalive_timeout                    = '15',
  $php_memory_limit                     = '200M',
  $upload_max_filesize                  = '100M',
  $post_max_size                        = '100M',
  $max_execution_time                   = '30',
  $max_input_time                       = '60',
  $short_open_tag                       = 'Off',
  $packages                             = ['git','subversion','imagemagick','ghostscript','antiword','xpdf','libav-tools','libimage-exiftool-perl'],
  $adminpassword                        = 'RSadminpwd',
  $spider_password                      = 'YtE9YpASUZYV',
  $scramble_key                         = 'Y4EgATAjyVyn',
  $api_scramble_key                     = 'uGEHaqaHuHA9',
  $email_from                           = 'resourcespace@naturalis.nl',
  $email_notify                         = 'resourcespace@naturalis.nl',
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

# Install letsencrypt cert
  if ($letsencrypt == true){
    class { 'role_resourcespace::letsencrypt': 
      require                 => Package[$packages],
    }
  }

# Configure MySQL Security and finetuning if needed
  class { 'mysql::server::account_security':}
  class { 'mysql::server':
    root_password         => $mysql_root_password,
    service_enabled       => true,
    service_manage        => true,
  }

# Create resourcespace database
  mysql::db { 'resourcespace':
    user           => 'resourcespace',
    password       => $mysql_password,
    host           => 'localhost',
    grant          => ['ALL'],
    require        => Class['mysql::server'],

  }

# Create buildscript.sh file
  file { "/opt/buildscript.sh":
    ensure      => present,
    content     =>  template('role_resourcespace/buildscript.sh.erb'),
    owner       => 'root',
    group       => 'root',
    mode        => '0700',
  }

# Create config.php file
  file { "/opt/config.php":
    ensure      => present,
    content     =>  template('role_resourcespace/config.php.erb'),
    owner       => 'root',
    group       => 'root',
    mode        => '0600',
  }

# Create empty database file
  file { "/opt/db.sql":
    ensure      => present,
    source      => 'puppet:///modules/role_resourcespace/db.sql',
    owner       => 'root',
    group       => 'root',
    mode        => '0600',
  }

# Run Buildscript
  exec { 'Build resourcespace':
    command     => "/opt/buildscript.sh",
    path        => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],
    unless      => "/usr/bin/test -f ${docroot}/include/config.php",
    require     => [File["/opt/db.sql"],File["/opt/buildscript.sh"],Class['role_resourcespace::instances']]

  }

# Create daily cronjob
  cron { 'copy hitcount':
    command => "/usr/bin/wget -q -r http://localhost/pages/tools/cron_copy_hitcount.php",
    user    => root,
    hour    => 2,
    minute  => 0
  }

# create svn update check script for for usage with monitoring tools ( sensu )
  file {'/usr/local/sbin/svnupdatechk.sh':
    ensure        => 'file',
    mode          => '0777',
    content       => template('role_resourcespace/svnupdatechk.sh.erb')
  }

# export check so sensu monitoring can make use of it
  @sensu::check { 'Check SVN update' :
    command => '/usr/local/sbin/svnupdatechk.sh',
    tag     => 'central_sensu',
 }



}
