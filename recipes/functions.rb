#
# Cookbook Name:: fish
# Recipe:: functions
#
# Author:: Gabor Pihaj
# Author:: Florian Peter | visalyze <florian.peter@visalyze.org>
#
node['fish']['functions']['install_for_users'].each do |current_user|

    remote_directory "/home/#{current_user}/.config/fish/functions" do
        source "functions"
        files_backup 10
        files_owner "#{current_user}"
        files_group "#{current_user}"
        files_mode 00644
        owner "#{current_user}"
        group "#{current_user}"
        mode 00755
        purge true
    end

end
