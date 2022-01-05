# Client configuration file (w/ Puppet)
include stdlib

file_line { 'IdentifyFile':
  path => '/etc/ssh/ssh_config',
  line => 'IdentityFile ~/.ssh/school',
}

file_line { 'PasswordNotRequired':
  path => '/etc/ssh/ssh_config',
  line => 'PasswordAuthentication no',
}
