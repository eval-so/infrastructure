class sbt {
  file { '/usr/local/lib64/sbt': ensure => directory }
  exec { 'download_sbt_jar':
    require => File['/usr/local/lib64/sbt'],
    cwd     => '/usr/local/lib64/sbt',
    command => '/usr/bin/curl -L -o sbt-launch.jar http://da.gd/sbt0112lau',
    creates => '/usr/local/lib64/sbt/sbt-launch.jar'
  }
  file { '/usr/local/bin/sbt':
    require => Exec['download_sbt_jar'],
    mode    => '0755',
    owner   => root,
    group   => root,
    source  => 'puppet:///sbt/sbt-launch.sh'
  }
  file { '/etc/profile.d/usr_local_path.sh':
    mode   => '0644',
    owner  => root,
    group  => root,
    source => 'puppet:///sbt/usr_local_path.sh'
  }
}
