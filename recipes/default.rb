#
# Cookbook Name:: fish
# Recipe:: default
#
# Author:: Gabor Pihaj
#

case node['fish']['install_method']
when "package"
  case node['platform_family']
  when /(debian|centos|fedira)/
    package "fish"
  end
when "source"
  install_dir = node['fish']['src_dir']

  include_recipe "build-essential"

  package "libncurses5-dev"

  directory install_dir do
    owner "root"
    mode "0755"
    recursive true
    action :create
  end

  tarball = "fish-#{node['fish']['release']}.tar.gz"
  remote_url = "http://fishshell.com/files/#{node['fish']['release']}/#{tarball}"

  remote_file "#{install_dir}/#{tarball}" do
  	source remote_url
  	action :create_if_missing
  end

  bash "Make and install fish shell" do
    cwd install_dir
    code <<-EOH
      tar zxf #{tarball}
      cd fish
      autoconf
      ./configure
      make
      make install
    EOH

    not_if { ::File.exists?('/usr/local/bin/fish') }
  end

end

if node['fish']['set_as_default']
  bash "Enable fish as login shell" do
  	code "echo /usr/local/bin/fish >>/etc/shells"
  	not_if "grep -q fish /etc/shells"
  end

  bash "Set as default" do 
  	code "chsh -s /usr/local/bin/fish vagrant"
  end
end