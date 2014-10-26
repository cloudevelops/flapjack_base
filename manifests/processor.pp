define flapjack_base::processor (
  $base_redis_host,
  $base_redis_port,
  $base_redis_db,
) {

  if $name == 1 {

  } else {
    file { "/etc/flapjack/flapjack_processor_${name}.yaml":
      content => template('flapjack_base/etc/flapjack/flapjack_processor.yaml.erb'),
    }

    file { "/etc/init/flapjack_processor_${name}.conf":
      content => template('flapjack_base/etc/init/flapjack_processor.conf.erb'),
    }

    $dec = $name - 1
    $hash = {
      "${dec}" => {}
    }

    $processor_defaults = {
      base_redis_host => $base_redis_host,
      base_redis_port => $base_redis_port,
      base_redis_db => $base_redis_db
    }

    create_resources('flapjack_base::processor',$processor_defaults, $hash)

  }
}