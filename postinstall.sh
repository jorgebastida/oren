#! /bin/bash

echo "Update Upgrade"
sudo apt-get update
sudo apt-get safe-upgrade

echo "Install puppet requirements"
apt-get install rubygems git-core irb libopenssl-ruby libreadline-ruby rdoc ri ruby ruby-dev git-core augeas-lenses augeas-tools libaugeas-ruby

echo "Install puppet"
gem install puppet -v 2.7.1 --no-ri --no-rdoc
