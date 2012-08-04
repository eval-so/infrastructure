class breakpoint::frontend {
  include mysql::server
  include httpd::server

  package {[
    'scala',
    'git'
  ]: ensure => present }

  file { [
    '/srv',
    '/srv/www'
  ]:
    ensure  => directory,
    owner   => apache,
    group   => apache,
    mode    => '0644',
    require => Package['httpd']
  }

  exec { 'pull_breakpoint_mainsite':
    cwd     => '/srv/www/',
    command => '/usr/bin/git clone git://github.com/breakpoint-eval/breakpoint.git',
    creates => '/srv/www/breakpoint',
    require => [File['/srv/www'], Package['git']]
  }

  file { '/srv/www/breakpoint':
    require => Exec['pull_breakpoint_mainsite'],
    owner   => apache,
    group   => apache,
    mode    => '0644',
    recurse => true
  }
}
