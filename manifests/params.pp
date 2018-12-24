class mde::params {
#	$package_name	    = 'mc'
	$package_name       = [ 'libpango1.0-0',  'libgconf-2-4', 'gconf-service', 'libreoffice', 'libreoffice-l10n-ru', 'libreoffice-help-ru', 'remmina', 'remmina-plugin*', 'w3m', 'ethtool', 'lsb-base', 'alien', 'vino', 'git', 'default-jre', 'doublecmd-common', 'evolution' ]
	$package_name_wget  = [ 'sputnik-browser-astralinux_amd64.deb', 'Yandex.deb', 'chromium-gost-70.0.3538.110-linux-amd64.deb' ]
#	$package_name_wget  = []
	$package_ensure     = 'present'
}
