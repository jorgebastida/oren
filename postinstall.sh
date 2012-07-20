#! /bin/bash

echo "Update Upgrade"
sudo apt-get update
sudo apt-get safe-upgrade

echo "Install puppet requirements"
apt-get install rubygems git-core irb libopenssl-ruby libreadline-ruby rdoc ri ruby ruby-dev git-core augeas-lenses augeas-tools libaugeas-ruby

echo "Install puppet"
gem install puppet -v 2.7.1 --no-ri --no-rdoc

echo "And now?"
echo "1. Setup a public key using ssh-keygen -t rsa -C \"email\""
echo "2. Setup a deploy key on Github"
echo "3. Clone this repo ~/devops"
echo "4. sudo puppet apply devops/puppet/manifests/site.pp --modulepath devops/puppet/modules --manifestdir devops/puppet/manifests"
