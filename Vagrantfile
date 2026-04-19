Vagrant.configure("2") do |config|
  config.vm.box = "debian/bookworm64"
  
  config.vm.synced_folder "./shared", "/home/vagrant/shared",
    type: "nfs",
    create: true,
    nfs_version: 4,
    nfs_udp: false

  config.nfs.map_uid = Process.uid
  config.nfs.map_gid = Process.gid

    config.vm.define "vm1" do |node|
    node.vm.hostname = "debian1"
    node.vm.network "private_network", ip: "192.168.56.101"
    node.vm.provider "virtualbox" do |vb|
      vb.name = "Debian_Node_1"
      vb.memory = "1024"
      vb.cpus = 1
    end
    
    node.vm.provision "file",
      source: "testfile.txt",
      destination: "/home/vagrant/test_file.txt"
  end

  config.vm.define "vm2" do |node|
    node.vm.hostname = "debian2"
    node.vm.network "private_network", ip: "192.168.56.102"
    node.vm.provider "virtualbox" do |vb|
      vb.name = "Debian_Node_2"
      vb.memory = "1024"
      vb.cpus = 1
    end
    
    node.vm.provision "file",
      source: "testfile.txt",
      destination: "/home/vagrant/test_file.txt"
  end
end
