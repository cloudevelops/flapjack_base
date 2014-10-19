# == Class: flapjack_base
#
# Full description of class flapjack_base here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { flapjack_base:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class flapjack_base (
  $base_redis_host = $flapjack_base::params::base_redis_host,
  $base_redis_port = $flapjack_base::params::base_redis_port,
  $base_redis_db = $flapjack_base::params::base_redis_db,
  $base_redis_bind = $flapjack_base::params::base_redis_bind,
  $base_internal_redis = $flapjack_base::params::internal_redis,
  $base_flapjack_host = $flapjack_base::params::base_flapjack_host,
  $base_flapjack_user = undef,
  $base_nginx = $flapjack_base::params::base_nginx
) inherits flapjack_base::params {

  class {'::flapjack': } ->
  class {'::flapjack_base::config': }

  if $flapjack_base::base_nginx {
    include flapjack_base::nginx
  }

}
