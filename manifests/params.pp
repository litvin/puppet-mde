class mde::params {
#	$package_name_wget = [ 'chromium-gost-stable', 'myofficemail', 'myoffice', 'myoffice-presentation-editor-linux', 'sputnik-browser-stable', 'yandex-browser-beta' ]
	$package_ensure    = 'present'
        $ftp_server_name   = 'ftp://astra.am.local/install'
	$run_script_link   = 'LinkAstraCE.sh'
	$run_script_xdg    = 'link-desktop.desktop'

  	$mount_username    = 'rc'
	$mount_password    = ''
  	$mount_domain      = 'am.local'

  	$share_server_name = 'srv-01'
  	$pub_name 	   = 'pub'
  	$mount_dir         = 'mnt'

case $::osfamily {
    'Debian': {
	$package_name      = [ 'libpango1.0-0',  'libgconf-2-4', 'gconf-service', 'libreoffice', 'libreoffice-l10n-ru', 'libreoffice-help-ru', 'remmina', 'remmina-plugin*', 'w3m', 'ethtool', 'lsb-base', 'alien', 'vino', 'git', 'default-jre', 'doublecmd-common', 'evolution' ]
	$package_name_wget = [ 'chromium-gost-stable', 'myofficemail', 'myoffice', 'myoffice-presentation-editor-linux', 'sputnik-browser-stable', 'yandex-browser-beta' ]
	$suffix = 'deb'
	$install_provider  = 'dpkg'
	    }
    'Redhat': {
        $package_name      = [ 'cifs-utils', 'remmina', 'remmina-plugins-nx.x86_64', 'remmina-plugins-rdp.x86_64', 'remmina-plugins-spice.x86_64', 'remmina-plugins-vnc.x86_64']
	$package_name_wget = [ 'MyOffice_Presentation_Editor_Linux.x86_64', 'myoffice.x86_64' ]
	$suffix		   = 'rpm'
	$install_provider  = 'rpm'
	    }
      }
}
