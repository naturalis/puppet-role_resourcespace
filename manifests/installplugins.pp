# == Define: role_resourcespace::installplugins
#
# === Authors
#
# Author Name <hugo.vanduijn@naturalis.nl>
#
#
class role_resourcespace::installplugins (
){

# checkout plugin repo
  vcsrepo { $role_resourcespace::plugin_location:
    ensure      => $role_resourcespace::plugin_repo_ensure,
    provider    => git,
    source      => $role_resourcespace::plugin_repo,
    revision    => $role_resourcespace::plugin_repo_revision,
    notify      => Exec['rsync plugins']
  }

# rsync plugins
  exec {'rsync plugins':
    command     => "rsync -avh ${role_resourcespace::plugin_location}/* ${role_resourcespace::docroot}/plugins/ --delete --exclude '.git' --exclude '.gitignore'",
    path        => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],
    refreshonly => true,
  }

}
