#
# Cookbook Name:: ubuntu-cloud-archive
# Recipe:: default
#
# Copyright 2012, X.commerce
#
# All rights reserved - Do Not Redistribute
#

# Instructions from https://wiki.ubuntu.com/ServerTeam/CloudArchive.

if not node['package_component'].nil?
  release = node['package_component']
else
  release = "essex-final"
end

dist="#{node['lsb']['codename']}-updates/#{release}"

Chef::Log.info("dist=#{dist}")

# Key taken from http://jujucharms.com/~openstack-ubuntu-testing/quantal/nova-volume/hooks/nova-volume-common.

apt_repository "ubuntu-cloud-archive" do
  uri "http://ubuntu-cloud.archive.canonical.com/ubuntu"
  distribution "#{dist}"
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "EC4926EA"
  notifies :run, "execute[apt-get update]", :immediately
end