class mysql::client {
  package {[
    'mysql',
    'mysql-devel'
  ]: ensure => present }
}
