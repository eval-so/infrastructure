class rvm::dependencies {
  package { [
    'which',
    'make',
    'gettext-devel',
    'libcurl-devel',
    'zlib-devel',
    'openssl-devel',
    'cpio',
    'expat-devel',
    'wget',
    'bzip2',
    'sendmail',
    'mailx',
    'libxml2',
    'libxml2-devel',
    'libxslt',
    'libxslt-devel',
    'readline-devel',
    'patch',
    'git'
  ]: ensure => installed }
}
