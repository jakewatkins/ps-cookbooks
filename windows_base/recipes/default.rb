#
# Cookbook:: windows_base
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.


file 'c:/server-message.txt' do
    content node.default['windows_base']['motd']
    owner 'root'
    group 'root'
    mode '0666'
end