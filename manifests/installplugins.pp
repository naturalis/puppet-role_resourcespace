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
  }

# make createSymlink function
define createSymlink {
  file { "${role_resourcespace::docroot}/plugins/$name":
    ensure      => 'link',
    target      => "${role_resourcespace::plugin_location}/$name",
    require     => Vcsrepo[$role_resourcespace::plugin_location]
 }
}

# create symlinks for each plugin in plugin_array
  createSymlink { $role_resourcespace::plugin_array: }
}
