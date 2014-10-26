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
}
