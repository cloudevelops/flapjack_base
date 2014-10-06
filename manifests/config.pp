class flapjack_base::config {

  file { '/etc/flapjack/flapjack-config.yaml':
    content  => template('flapjack_base/etc/flapjack/flapjack_config.yaml.erb'),
    notify => Service['flapjack'],
  }

  logrotate::rule { 'flapjack-log':
    path          => '/var/log/flapjack/*.log',
    maxage        => 31,
    size          => '100M',
    dateext       => true,
    dateformat    => '.%Y%m%d',
    copy          => true,
    copytruncate  => true,
    compress      => true,
    compresscmd   => '/bin/bzip2',
    compressext   => '.bz2',
  }

  if !$flapjack_base::base_internal_redis {
    service { 'redis-flapjack':
      ensure     => stopped,
      enable     => false,
      hasstatus  => true,
      hasrestart => false,
    }
  }

}
