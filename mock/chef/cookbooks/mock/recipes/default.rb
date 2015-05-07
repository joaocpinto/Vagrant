#
# Cookbook Name:: mock
# Recipe:: default
#

# add epel centos 7
yum_repository 'epel' do
  description 'Extra Packages for Enterprise Linux'
  mirrorlist 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-7&arch=$basearch'
  gpgkey 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7'
  action :create
end

# install packages
%w{
    rpm-build
    mock

}.each do |p|
    yum_package "#{p}" do
        action :install
    end
end


# user mockbuilder && group
user 'mockbuilder' do
    supports :manage_home => true
    comment 'User to build RPMs with Mock'
    gid 'mock'
    home '/home/mockbuilder'
    shell '/bin/bash'
    action :create
end

 

# template dir
%w[
    /home/mockbuilder/packages
    /home/mockbuilder/packages/buildroot.clean
    /home/mockbuilder/packages/buildroot.clean/RPMS
    /home/mockbuilder/packages/buildroot.clean/SRPMS
    /home/mockbuilder/packages/buildroot.clean/BUILD
    /home/mockbuilder/packages/buildroot.clean/SPECS
    /home/mockbuilder/packages/buildroot.clean/SOURCES
].each do |path|
    directory path do
        owner 'mockbuilder'
        group 'mock'
        mode '0755'
        action :create
#        recursive true
    end
end

