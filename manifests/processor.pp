define flapjack_base::processor (
  $base_redis_host,
  $base_redis_port,
  $base_redis_db,
  $base_new_check_scheduled_maintenance_duration,
) {

  if $name != 1 {
    file { "/etc/flapjack/flapjack_processor_${name}.yaml":
      content => template('flapjack_base/etc/flapjack/flapjack_processor.yaml.erb'),
    } ->
    file { "/etc/init/flapjack_processor_${name}.conf":
      content => template('flapjack_base/etc/init/flapjack_processor.conf.erb'),
    } ->
    service { "flapjack_processor_${name}":
      ensure => running,
      subscribe => [ File[ "/etc/flapjack/flapjack_processor_${name}.yaml" ] ],
    }

    $dec = $name - 1
    $hash = {
      "${dec}" => {}
    }

    $processor_defaults = {
      base_redis_host => $base_redis_host,
      base_redis_port => $base_redis_port,
      base_redis_db => $base_redis_db,
      base_new_check_scheduled_maintenance_duration => $base_new_check_scheduled_maintenance_duration,
    }

    create_resources('flapjack_base::processor',$hash,$processor_defaults)

  }
}