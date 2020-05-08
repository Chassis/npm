# Install npm
class npm (
	$config,
	$path = '/vagrant/extensions/npm',
) {
	if ( ! empty($config[disabled_extensions]) and 'chassis/npm' in $config[disabled_extensions] ) {
		exec { 'uninstall npm':
			path    => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ],
			command => 'npm uninstall npm -g'
		}
	} else {
		exec { 'install npm':
			path    => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ],
			command => 'npm install -g npm@latest',
			require => [ Class['nodejs'] ],
			unless  => 'which npm',
		}

		if ( $config[npm] and $config[npm][paths]) {
			chassis::install_npm { $config[npm][paths]: }
		}
	}
}

