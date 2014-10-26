define flapjack_base::processor {

  file { "/etc/flapjack/flapjack_processor_${$name}.yaml":
    content => template('flapjack_base/etc/flapjack/flapjack_processor.yaml.erb'),
    require => Class['flapjack_base'];
  }

  file { "/etc/init/flapjack_processor_${$name}.conf":
    content => template('flapjack_base/etc/init/flapjack_processor.conf.erb'),
    require => [ Class['flapjack_base'], File["/etc/flapjack/flapjack_processor_${$name}.yaml"] ];
  }

}