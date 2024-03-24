# Puppet 3.8 doesn't have the .each function and we need an alternative.
define npm::install_npm {
  exec { "Installing npm ${name}":
    path      => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ],
    cwd       => $name,
    command   => 'npm install',
    require   => [ Exec['install npm'] ],
    logoutput => true,
  }
}