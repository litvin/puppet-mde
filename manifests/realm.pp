class mde::realm(
	String $domain_name	= $::mde::domain_name,
	String $host_ad_name	= $::mde::host_ad_name,
){
        package { "fly-admin-ad-client":
    	                ensure   => present 
		}
	
        exec { 'run_realm':
  	  path    => '/usr/bin:/usr/sbin:/bin',
 	  command => '/usr/bin/astra-winbind -dc dc-01.am.local -d am.local -g AM -n 10.44.0.1 -u rc -p Qwerty1! -y ',
  	  unless  => "astra-winbind -i | grep succeeded",
	     }
}	


