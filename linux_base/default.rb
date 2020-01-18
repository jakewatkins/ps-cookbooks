#
# Cookbook:: linux_base
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

file '/etc/motd' do
    content node.default['linux_base']['motd']
    owner 'root'
    group 'root'
    mode '0666'
end
