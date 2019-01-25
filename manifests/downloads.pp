class mde::downloads(
	Array[String] $package_name_downloads  = $::mde::package_name_wget,
	Array[String] $downloads	       = $::mde::downloads,
	String 	      $ftp_server_name	       = $::mde::ftp_server_name,
	String 	      $suffix		       = $::mde::suffix, 
){
        include wget

        $package_name_downloads.each | $index_download, $value_download | {
        wget::fetch { "$value_download":
                      source             => "$ftp_server_name/$value_download.$suffix",
                      destination        => "/tmp/$value_download.$suffix",
                      timeout            => 0,
                      verbose            => true,
                      nocheckcertificate => true,
	            }	
         }

	case $::osfamily {
	    'Debian': {
		    }
	    'Redhat': {
		        $downloads.each | $index_download, $value_download | {
			        wget::fetch { "$value_download":
                     		source             => "$ftp_server_name/$value_download",
                     		destination        => "/tmp/$value_download",
                     		timeout            => 0,
                      		verbose            => true,
                      		nocheckcertificate => true,
	            	}
		    }
	      }

	}
}

