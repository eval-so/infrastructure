class mysql::client {
  package {[
    'mysql-client',
    'mysql-devel'
  ]: ensure => present }
}

class mysql::server extends mysql::client {
  package { 'mysql-server': ensure => present }
  service { 'mysqld':
    ensure => running,
    enable => true,
    requires => Package['mysql-server']
  }
}
