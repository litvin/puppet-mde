class mde::downloads(
	Array[String] $package_name_downloads  = $::mde::package_name_wget,
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
}

