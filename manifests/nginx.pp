class flapjack_base::nginx {

  include nginx_base

  if $flapjack_base::base_flapjack_user {
    htpasswd_base::user { '/etc/nginx/flapjack':
      user => $flapjack_base::base_flapjack_user,
      owner => 'www-data',
    }

    $auth_cfg = {
      'auth_basic' => '"Authorization Required"',
      'auth_basic_user_file' => 'flapjack'
    }

  } else {
    $auth_cfg = {}
  }

  nginx::resource::vhost { 'flapjack':
    listen_port => 80,
    server_name => split($flapjack_base::base_flapjack_host, ','),
    www_root => '/usr/share/flapjack3',
    use_default_location => false,
    vhost_cfg_append => $auth_cfg,
  }

  nginx::resource::location { 'default':
    location => '/',
    vhost => 'flapjack',
    index_files => [],
    proxy => 'http://127.0.0.1:3080',
    location_cfg_prepend => $auth_cfg,
  }

}
