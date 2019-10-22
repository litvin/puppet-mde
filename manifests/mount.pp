class mde::mount(
  String $mount_username    = $mde::mount_username,
  String $mount_password    = $mde::mount_password,
  String $mount_domain      = $mde::mount_domain,

  String $share_server_name = $mde::share_server_name,
  String $pub_name 	    = $mde::pub_name,
  String $mount_dir         = $mde::mount_dir,
) {

  package { "cifs-utils":
        ensure   => present 
	}

  file  { "/root/.smbclient":
 	ensure => file,
	owner  => 0,
 	group  => 0,
  	content => template("$module_name/smbclient.erb")
	}

  mount { "//$share_server_name/$share_pub" :
        name    => '/mnt',
        ensure  => 'mounted',
        device  => "//$share_server_name/$pub_name",
        fstype  => 'cifs',
        options => 'credentials=/root/.smbclient',
        }

  package { "pam_mount":
        ensure   => present
        }

  file  { "/etc/security/pam_mount.conf.xml":
        ensure => file,
        owner  => 0,
        group  => 0,
        content => template("$module_name/pam_mount.conf.xml.erb")
        }

  file  { "/etc/pam.d/password-auth":
        ensure => file,
        owner  => 0,
        group  => 0,
        content => template("$module_name/password-auth.erb")
        }
}
