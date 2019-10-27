class mde::params {
#	$package_name_wget = [ '' ]
	$package_ensure    = 'present'
        $ftp_server_name   = 'http://ftp.iz.local/install'
	$run_script_xdg    = 'link-desktop.desktop'

  	$mount_username    = '' 
	$mount_password    = ''
  	$mount_domain      = 'iz.local'

  	$share_server_name = 'iz-srv03'
  	$pub_name 	   = 'data1/pub'
  	$mount_dir         = 'mnt'

	$se_mode	   = 'disabled'
	$se_type	   = 'targeted'

case $::osfamily {
    'Debian': {
	$package_name      = [ 'libpango1.0-0',  'libgconf-2-4', 'gconf-service', 'libreoffice', 'libreoffice-l10n-ru', 'libreoffice-help-ru', 'remmina', 'remmina-plugin*', 'w3m', 'ethtool', 'lsb-base', 'alien', 'vino', 'git', 'default-jre', 'doublecmd-common', 'evolution' ]
	$package_name_local = [ 'myoffice-presentation-editor-linux', 'sputnik', 'yandex' ]
	$downloads = [ '' ]
	$suffix = 'deb'
	$install_provider  = 'dpkg'
	$run_script_link   = 'LinkAstraCE.sh'
	    }
    'Redhat': {
        $link_name_all	   = ['organizer.desktop', 'remmina.desktop', 'Ya_CGP.desktop', 'Ya_exchange.desktop', 'r7-office-desktopeditors.desktop', 'share.desktop', 'Ya_consultant.desktop', 'Ya_garant.desktop', 'readme.desktop', 'myofficemail.desktop', 'myoffice_Presentation.desktop', 'myoffice_presentetion_editor.desktop','myoffice_table.desktop', 'myoffice_text.desktop']
        $link_name_remmina  = [ '15440928710014.remmina', '1544092978571.remmina', '1568096914714.remmina']
        $package_name      = [ 'remmina', 'remmina-plugins-nx.x86_64', 'remmina-plugins-rdp.x86_64', 'remmina-plugins-spice.x86_64', 'remmina-plugins-vnc.x86_64']
	$downloads = [ 'linux-amd64.tgz', 'MyOfficeMailSilent.sh', 'MyOffice_Standard_Documents_Linux_2019.01.run' ]
	$package_name_local = [ 'r7-office-organizer', 'r7-office', 'yandex-browser-beta', 'MyOffice_Presentation_Editor_Linux', 'chromium-gost']
	$suffix		   = 'rpm'
	$install_provider  = 'yum'

	case $::lsbdistcodename {
	'MUROM'  : {
		$run_script_link   = 'LinkMurom.sh'
	    	  }
        'COBALT' : {
		$run_script_link   = 'LinkCobalt.sh'

		  }
      }
    }
  }
}
