#
# Cookbook Name:: shorewall
# Recipe:: default
#
# Copyright 2011-2012, Binary Marbles Trond Arve Nordheim
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Install Shorewall.
package 'shorewall' do
  action :install
end

# Enable the Shorewall init script.
template '/etc/default/shorewall' do
  source 'shorewall-enable.erb'
  owner 'root'
  group 'root'
  mode 0644
end

# Write the Shorewall configuration files.
%w(shorewall.conf interfaces zones policy rules masq hosts tunnels).each do |configuration_file|
  template "/etc/shorewall/#{configuration_file}" do
    source "#{configuration_file}.erb"
    owner 'root'
    group 'root'
    mode 0644
    notifies :restart, 'service[shorewall]'
  end
end

# Configure the Shorewall service.
service 'shorewall' do
  supports :restart => true
  action [:enable, :start]
end
