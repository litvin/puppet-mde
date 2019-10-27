class mde::link(
  String $run_script_link          = $mde::run_script_link,
  String $run_script_xdg           = $mde::run_script_xdg,
  Array[String] $link_name_all     = $mde::link_name_all,
  Array[String] $link_name_remmina = $mde::link_name_remmina,  
) {
   
  file { '/opt/run':
    ensure => 'directory',
    owner  => 0,
    group  => 0,
    mode   => '0755',
  }

 file { '/opt/run/all':
    ensure => 'directory',
    owner  => 0,
    group  => 0,
    mode   => '0755',
  }

 file { '/opt/run/remmina':
    ensure => 'directory',
    owner  => 0,
    group  => 0,
    mode   => '0755',
  }

  file { "/etc/xdg/autostart/${run_script_xdg}":
    ensure => file,
    owner  => 0,
    group  => 0,
    mode   => "644",
    content => template("$module_name/$run_script_xdg.erb"),
  }

  file { "/opt/run/${run_script_link}":
    ensure => file,
    owner  => 0,
    group  => 0,
    mode   => "755",
    content => template("$module_name/$run_script_link.erb"),
  }

  $link_name_all.each | $index_local, $value_local | {
    file { "/opt/run/all/${value_local}":
      ensure => file,
      owner  => 0,
      group  => 0,
      mode   => "755",
      content => template("$module_name/all/$value_local.erb"),
    }
  }

  $link_name_remmina.each | $index_local, $value_local | {
     file { "/opt/run/remmina/${value_local}":
       ensure => file,
       owner  => 0,
       group  => 0,
       mode   => "755",
       content => template("$module_name/remmina/$value_local.erb")
   }
 }

  file { '/opt/run/MyOfficeMailSilent.sh':
    ensure => link,
    target => '/opt/distr/MyOfficeMailSilent.sh',
  }

}
