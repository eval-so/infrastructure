class breakpoint::compilation_node {

  user { 'breakpoint':
    ensure => present,
    comment => "Breakpoint Evaluation User",
    groups => ['rvm'],
    home => '/home/breakpoint'
  }
    

  # Rubies.
  include rvm
  if $rvm_installed == true
    rvm_system_ruby {
      'ruby-1.9.3-p125':
        ensure => present,
        default_use => true;
      'ruby-1.8.7-p357':
        ensure => present;
    }
  }

  # Other programming languages.
  package {[
    'php',
    'ghc',
    'perl',
    'python2',
    'python3',
    'Io-language',
    'scala',
    'gcc',
    'gcc-c++',
    'lua',
    'java-1.7.0-openjdk',
    'r',
    'clojure',
    'ldc'
  ]: ensure => present}

}

class breakpoint::frontend {
  package {[
    'scala'
  ]: ensure => present }

  file { [
    '/srv',
    '/srv/www'
  ]:
    ensure => directory,
    owner => apache,
    group => apache,
    mode => 644,
    requires => Package['httpd']
  }

  exec { "pull_breakpoint_mainsite":
    command => "/usr/bin/git clone git://github.com/breakpoint-eval/breakpoint.git",
    creates => "/srv/www/breakpoint",
    requires => File['/srv/www']
  }
}
