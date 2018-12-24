class mde::install(
	Array[String] $package_name       = $::mde::package_name,
	Array[String] $package_name_wget  = $::mde::package_name_wget,
	String $package_ensure            = $::mde::package_ensure,
){
	$package_name.each | $index, $value | {
	package { $value:
			ensure => $package_ensure
		}
	}	

        include wget
	
        $package_name_wget.each | $index_wget, $value_wget | {
        wget::fetch { "download the $value_wget":
                      source             => "ftp://foreman.laba.lan/pub/browsers/$value_wget",
                      destination        => "/tmp/$value_wget",
                      timeout            => 0,
                      verbose            => true,
                      nocheckcertificate => true,
	          }	
         package    { "$value_wget":
    		      ensure => installed,
                      provider => dpkg,
                      source => "/tmp/$value_wget",
                   }
         }
}

