class flapjack_base::monitoring::collectd {

  collectd::plugin::curl_json { 'flapjack':
    url => 'http://localhost:3080/self_stats.json',
    instance => 'flapjack',
    keys => {
      events_queued => {
        type => 'gauge'
      }
    }
  }

}