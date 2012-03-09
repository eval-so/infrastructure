class httpd::server {
  package { 'httpd': ensure => present }
  service { 'httpd':
    ensure => running,
    enable => true,
    requires => Package['httpd']
  }
}
