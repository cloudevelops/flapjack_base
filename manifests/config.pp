class flapjack_base::config {

  file {'flapjack-diner':
    ensure => present,
    provider => 'gem'
  }

  file {'/etc/init.d/flapjack':
    ensure => absent,
  }->
  file { '/etc/flapjack/flapjack_config.yaml':
    content  => template('flapjack_base/etc/flapjack/flapjack_config.yaml.erb'),
  }
  file { "/etc/init/flapjack.conf":
    content => template('flapjack_base/etc/init/flapjack.conf.erb'),
  } ->
  service { 'flapjack':
    ensure => running,
    subscribe => [ File[ "/etc/flapjack/flapjack_config.yaml" ] ],
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
