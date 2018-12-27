class mde::downloads(
	Array[String] $package_name_downloads  = $::mde::package_name_wget
){
        include wget
	
        $package_name_downloads.each | $index_download, $value_download | {
        wget::fetch { "$value_download":
                      source             => "ftp://foreman.laba.lan/pub/install/$value_download",
                      destination        => "/tmp/$value_download",
                      timeout            => 0,
                      verbose            => true,
                      nocheckcertificate => true,
	            }	
         }
}

