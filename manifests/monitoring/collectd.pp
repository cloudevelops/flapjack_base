class flapjack_base::monitoring::collectd {

  collectd::plugin::curl_json { 'flapjack':
    url => 'http://localhost:3080/self_stats.json',
    instance => 'flapjack',
    keys => {
      events_queued => {
        type => 'gauge'
      },
      all_entities => {
        type => 'gauge'
      },
      failing_entities => {
        type => 'gauge'
      },
      all_checks => {
        type => 'gauge'
      },
      failing_checks => {
        type => 'gauge'
      },
      total_keys => {
        type => 'gauge'
      },
      'processed_events/all_time/total' => {
        type => 'derive'
      },
      'processed_events/all_time/ok' => {
        type => 'derive'
      },
      'processed_events/all_time/failure' => {
        type => 'derive'
      },
      'processed_events/all_time/action' => {
        type => 'derive'
      }
    }
  }

}