class flapjack_base::redis {

  Class['flapjack_base'] -> Class['flapjack_base::redis']

  class {'redis_base':
    conf_bind => hiera('flapjack_base::base_redis_bind')
  }

}
