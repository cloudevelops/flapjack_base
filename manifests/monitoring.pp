class flapjack_base::monitoring {

  if $flapjack_base::base_monitoring_collectd {
    include flapjack_base::monitoring::collectd
  }

}
