This readme explains how to use Vagrant to create Amazon EC2 instances

Keep the following data handy:

1. AWS Access Key ID
2. AWS Secret Access Key
3. Your AWS region : TCH users can ignore
4. Downlaod the pem file from amazon web console. Ignore if you already have one.
5. List of software you wan to install. bootstrap.sh already has a few to start with.

GOAL :
The Vagrantfile will create an Ubuntu 14.04 server on AWS as an m1.small instance

EXPLANATION :

Vagrant.configure("2") do |config|

    config.vm.box = "dimroc/awsdummy" #creates a dummy Virtual Machine which will be insatlled with Ubuntu 14.04

        config.vm.provider :aws do |aws, override|

            aws.tags = {"Name" => "NAME OF YOUR CLOUD INSTANCE",} #  E.g. Privacy web server

            aws.access_key_id = "YOUR ACCESS KEY GOES HERE"

            aws.secret_access_key = "YOUR SECRET ACCESS KEY GOES HERE"

            aws.keypair_name = "NAME OF YOUR KEY PAIR" #this is created on AWS web console

            aws.region = "us-west-2" # Your current region. Same for all TCH users

            aws.region_config "us-west-2", :ami => "ami-cd5311fd" # Ubuntu 14.04 ami

            aws.security_groups = [ 'vagrant' ] # this is created on AWS web console. vagrant has
            port 22 open to all for ssh and port 80 open to all for webserver. you can open custom ports based on your requirement

            override.ssh.username = "ubuntu" # this is common for all ubuntu ami's. DO NOT CHANGE

            override.ssh.private_key_path = "~/.ssh/testkeypair.pem" # location where you store keypair pem file.
    end

    config.vm.provision :shell, :path => "bootstrap.sh" # this is for provisioning. Installs all software required after OS installation.
end