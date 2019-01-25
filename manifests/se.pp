class mde::se(
  String $se_mode        = $mde::se_mode,
  String $se_type        = $mde::se_type,
) {

	case $::osfamily {
	   'Debian': {
		    }
	   'Redhat': {
		class { selinux:
		 mode => $se_mode,
		 type => $se_type,
            	}
	    }
	}
}
