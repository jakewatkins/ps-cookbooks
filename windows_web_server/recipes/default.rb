#
# Cookbook:: windows_web_server
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.


# Update windows


# install .NET
windows_feature 'NetFx4ServerFeatures' do
    action :install
end

#  Install Application role
windows_feature 'IIS-WebServerRole' do 
    action :install
end 
 
 #windows_feature ‘Web-Mgmt-Console’ do 
 #   action :install 
 #end 
 
 #windows_feature ‘IIS-ASPNET45’ do 
 #  action :install
 #end 
 
 #windows_feature ‘IIS-StaticContent’ do 
 #   action :install 
 #end 

 service 'W3SVC' do 
    action [:start, :enable]
 end 

 #setup the web-site
 cookbook_file '/inetpub/wwwroot/testsite.zip' do
    source 'testsite.zip'
 #   mode '0755'
 #   owner 'root'
end

powershell_script 'expand site' do
    code "Expand-Archive -LiteralPath C:/inetpub/wwwroot/testsite.zip -DestinationPath C:/inetpub/wwwroot/testsite"
end

 