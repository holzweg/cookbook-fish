#
# Cookbook Name:: fish
# Recipe:: default
#
# Author:: Gabor Pihaj
#

case node['fish']['install_method']
when "package"
  case node['platform_family']
  when /(debian|rhel)/
    package "fish"
  end
when "source"
  include_recipe "build-essential"
  include_recipe "git"

  install_dir = node['fish']['src_dir']

  case node['platform_family']
  when "debian"
    package "libncurses5-dev"
  when "rhel"
    package "ncurses-devel"
  end

  directory install_dir do
    owner "root"
    mode "0755"
    recursive true
    action :create
  end

  git install_dir do
    repository "https://github.com/fish-shell/fish-shell.git"
    revision node['fish']['version']
    action :sync
  end

  bash "Make and install fish shell" do
    cwd install_dir
    code <<-EOH
     autoconf
      ./configure
      make
      make install
    EOH

    not_if "fish --version 2>&1 | grep -q #{node['fish']['release']}"
  end

end

if node['fish']['set_as_default']
  bash "Enable fish as login shell" do
  	code "echo /usr/local/bin/fish >>/etc/shells"
  	not_if "grep -q fish /etc/shells"
  end

  bash "Set as default" do 
  	code "chsh -s /usr/local/bin/fish vagrant"
    not_if "grep vagrant /etc/passwd | grep -q \/usr\/local\/bin\/fish"
  end
end