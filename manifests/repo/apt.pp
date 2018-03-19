# install the APT repo + key for the given distro
class logentries::repo::apt {
  include apt

  apt::key {'FA7FA2E59A243096E1B4105DA5270289C43C79AD':
    ensure  => present,
    content => $logentries::repo::key,
  }
  apt::source { 'logentries':
    location    => 'http://rep.logentries.com/',
    release     => $::lsbdistcodename,
    repos       => 'main',
    key         => 'FA7FA2E59A243096E1B4105DA5270289C43C79AD',
    comment     => 'logentries.com client repo, deployed by puppet module logentries',
    require     => Apt::Key['FA7FA2E59A243096E1B4105DA5270289C43C79AD'],
    before      => [Package['logentries-daemon'], Package['logentries']],
  }
}
