class mde::params {
	$package_name      = [ 'libpango1.0-0',  'libgconf-2-4', 'gconf-service', 'libreoffice', 'libreoffice-l10n-ru', 'libreoffice-help-ru', 'remmina', 'remmina-plugin*', 'w3m', 'ethtool', 'lsb-base', 'alien', 'vino', 'git', 'default-jre', 'doublecmd-common', 'evolution' ]
#	$package_name_wget = [ 'chromium-gost-70.0.3538.110-linux-amd64.deb', 'Yandex.deb', 'sputnik-browser-astralinux_amd64.deb', 'myofficemail.deb', 'MyOffice_Standard_Documents_Linux_2018.02_(1.14.0)_x64.deb', 'Presentation_Editor_Linux_x64.deb' ]
	$package_name_wget = [ 'chromium-gost-stable', 'myofficemail', 'myoffice', 'myoffice-presentation-editor-linux', 'sputnik-browser-stable', 'yandex-browser-beta' ]
	$package_ensure    = 'present'
        $ftp_server_name   = 'ftp://astra.am.local/install'
}
