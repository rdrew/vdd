
#!/bin/bash
 
VAGRANT_DIR="/vagrant"
RUBY_VERSION=1.9.3
 
# Branding...
cat "$VAGRANT_DIR/chef/shell/vdd.txt"
 
# Upgrade Chef.
echo "Updating Chef to 11.12.4 version. This may take a few minutes..."
# Installing RVM globally and default ruby.
apt-get update &> /dev/null
apt-get install build-essential ruby1.9.1-dev --no-upgrade --yes &> /dev/null
gem install chef --version 11.12.4 --no-rdoc --no-ri --conservative &> /dev/null
apt-get install curl --no-upgrade --yes &> /dev/null

echo "Installing RVM system-wide"
curl -sSL https://get.rvm.io | sudo bash -s stable &> /dev/null
usermod -g rvm vagrant &> /dev/null
source /etc/profile.d/rvm.sh

rvm install ${RUBY_VERSION} &> /dev/null
rvm use ${RUBY_VERSION} --default

# Upgrade Chef.
echo "Updating Chef to 11.12.8 version. This may take a few minutes..."
rvm @global do gem install chef --version 11.12.8 --no-rdoc --no-ri --conservative &> /dev/null
