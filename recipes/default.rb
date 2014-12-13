#
# Cookbook Name:: hastebin
# Recipe:: default
#
# Copyright 2014, Ric Lister
#
# All rights reserved - Do Not Redistribute
#

## install node
include_recipe "nodejs::install_from_source"

## install git repo
git '/data/hastebin' do
  repository 'https://github.com/seejohnrun/haste-server.git'
  user       node[:hastebin][:user]
  group      node[:hastebin][:group]
  notifies   :restart, 'service[hastebin]'
end

## install npm package dependencies
execute 'hastebin npm install' do
  cwd '/data/hastebin'
  command 'npm install'
end

## dir for paste data to live
directory '/data/hastebin/data' do
  user  node[:hastebin][:user]
  group node[:hastebin][:group]
end

## config file
template '/data/hastebin/config.js' do
  source 'config.js.erb'
  user  node[:hastebin][:user]
  group node[:hastebin][:group]
  notifies :restart, 'service[hastebin]'
end

## init script
template '/etc/init.d/hastebin' do
  source 'hastebin.erb'
  mode   0755
  notifies :restart, 'service[hastebin]'
end

## start the service
service 'hastebin' do
  supports :restart => true
  action [ :enable, :start ]
end
