class mde::install(
	Array[String] $package_name   = $::mde::package_name,
	String $package_ensure = $::mde::package_ensure,
){
	$package_name.each | $index, $value | {
#        notify { " Message Install $value ": }
	package { $value:
			ensure => $package_ensure
		}
	}	
}

