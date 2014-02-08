# == Class: proliant
#
# Full description of class proliant here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { proliant:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#

include apt 

class proliant {

  apt::source { 'hwraid':
    location   => 'http://hwraid.le-vert.net/debian',
    release    => 'wheezy',
    repos      => 'main',
    key        => 'true',
    key_source => 'http://hwraid.le-vert.net/debian/hwraid.le-vert.net.gpg.key',
    before     => Package['hpacucli'],
  }

  package { 'hpacucli':
    ensure     => 'latest',
  }

}


