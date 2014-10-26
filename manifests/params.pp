class flapjack_base::params {
  $base_redis_host = '127.0.0.1'
  $base_redis_port = '6380'
  $base_redis_db = '0'
  $base_redis_bind = '0.0.0.0'
  $base_internal_redis = true
  $base_flapjack_host = $fqdn
  $base_processor_count = 1
  $base_nginx = true
  $base_manage_service = true
  $base_monitoring_collectd = hiera('collectd_base::base_enabled',false)
  $base_jabber_enabled = false
  $base_jabber_queue = 'jabber_notifications'
  $base_jabber_server = 'jabber.example.com'
  $base_jabber_port = '5222'
  $base_jabber_jabberid = 'flapjack@jabber.example.com'
  $base_jabber_password = 'good-password'
  $base_jabber_alias = 'flapjack'
  $base_jabber_identifiers = [ "@flapjack" ]
  $base_jabber_rooms = [ "gimp@conference.jabber.example.com","log@conference.jabber.example.com" ]
  $base_new_check_scheduled_maintenance_duration = '0 seconds'
}
