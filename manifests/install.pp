class mde::install(
	Array[String] $package_name        = $::mde::package_name,
	Array[String] $package_name_local  = $::mde::package_name_local,
	String $package_ensure             = $::mde::package_ensure,
	String $install_provider           = $::mde::install_provider,
	String $suffix		           = $::mde::suffix,

){
	$package_name.each | $index, $value | {
         package { "$value":
    	                ensure   => $package_ensure
	  	 }
	}
	
	$package_name_local.each | $index_local, $value_local | {
         package { "$value_local":
	           ensure   => $package_ensure,
                   provider => $install_provider,
                   source   => "/tmp/$value_local.$suffix",
                 }
	}
}

