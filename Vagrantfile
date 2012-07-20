Vagrant::Config.run do |config|

  config.vm.boot_mode = :gui

  config.vm.provision :puppet do |puppet|
    puppet.module_path = "puppet/modules"
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "site.pp"
  end

  config.vm.define :nas do |nas_config|
    nas_config.package.name = "nas-precise-64.box"
    nas_config.vm.box = "nas-precise-64"
    nas_config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    nas_config.vm.host_name = "oren.jorgebastida.com"
    nas_config.vm.forward_port(80, 8080)
    nas_config.vm.network :hostonly, "33.33.33.10"
  end

end
