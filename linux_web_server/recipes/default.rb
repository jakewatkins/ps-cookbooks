#
# Cookbook:: linux_web_server
# Recipe:: default
#
# Copyright:: 2019, jkw, All Rights Reserved.

#install the unzip package
package 'unzip' do
    action :install
end

package 'apache2' do
    action :install
end

service "apache2" do
    action [:enable, :start]
end

cookbook_file '/var/www/testsite.zip' do
    source 'testsite.zip'
    mode '0755'
    owner 'root'
end

bash "extract files" do
    cwd "/var/www"
    code <<-EOH
    sudo unzip testsite.zip
    EOH
end

