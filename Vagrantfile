Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"
    config.vm.box_check_update = false


    config.vm.provider :virtualbox do |vb|
        vb.gui = true
        vb.cpus = 1
        vb.customize ["modifyvm", :id, "--memory", 4096]
        vb.customize ["modifyvm", :id, "--usb", "on"]
        vb.customize ["modifyvm", :id, "--usbehci", "off"]
        vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
        vb.customize ['modifyvm', :id, '--accelerate2dvideo', 'off']
        vb.customize ['modifyvm', :id, '--accelerate3d', 'on']
    end

    ports = [80, 443, 3000, 5000, 8000, 8080, 9090]

    ports.each do |p|
        config.vm.network "forwarded_port", guest: p, host: p
    end

    config.vm.provision "shell", path: "xfce.sh"
end
