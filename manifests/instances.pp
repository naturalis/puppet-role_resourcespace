# Create all virtual hosts from hiera
class role_resourcespace::instances (
    $instances,
)
{
  create_resources('apache::vhost', $instances)
}
