define flapjack_base::processor (
  $counter = 0,
) {

#  $newcounter = $counter + $name
  notify { "Name: ${name}, Counter: ${counter}, Newcounter: ${newcounter}": }
  if $name == 1 {

    notify { "Now is 1, doing nothing": }

  } else {
    file { "/etc/flapjack/flapjack_processor_${newcounter}.yaml":
      content => template('flapjack_base/etc/flapjack/flapjack_processor.yaml.erb'),
      require => Class['flapjack_base'];
    }

    file { "/etc/init/flapjack_processor_${newcounter}.conf":
      content => template('flapjack_base/etc/init/flapjack_processor.conf.erb'),
      require => [ Class['flapjack_base'], File["/etc/flapjack/flapjack_processor_${newcounter}.yaml"] ];
    }


    $dec = $name - 1
    $hash = {
      "${dec}" => {}
#        "counter" => $newcounter,
      }
#    }

    create_resources('processor', $hash)

  }
}