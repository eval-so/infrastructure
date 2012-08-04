class mysql::server inherits mysql::client {
  package { 'mysql-server': ensure => present }
  service { 'mysqld':
    ensure  => running,
    enable  => true,
    require => Package['mysql-server']
  }
}
