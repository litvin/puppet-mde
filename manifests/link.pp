class mde::link(
  String $run_script_link  = $mde::run_script_link,
  String $run_script_xdg  = $mde::run_script_xdg,
) {
  file { "/etc/xdg/autostart/${run_script_xdg}":
    ensure => file,
    owner  => 0,
    group  => 0,
    mode   => 644,
    content => template("$module_name/$run_script_xdg.erb")
  }

  file { "/opt/run/${run_script_link}":
    ensure => file,
    owner  => 0,
    group  => 0,
    mode   => 755,
    content => template("$module_name/$run_script_link.erb")
  }

}
