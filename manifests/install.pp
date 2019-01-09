class mde::install(
	Array[String] $package_name        = $::mde::package_name,
	Array[String] $package_name_local  = $::mde::package_name_local,
	String $package_ensure             = $::mde::package_ensure,
){
	$package_name.each | $index, $value | {
         package { "$value":
    	                ensure   => $package_ensure
	  	 }
	}
	
	$package_name_local.each | $index_local, $value_local | {
         package { "$value_local":
	           ensure   => installed,
                   provider => dpkg,
                   source   => "/tmp/$value_local.deb",
                 }
	}
}

