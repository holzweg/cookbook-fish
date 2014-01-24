#
# Cookbook Name:: fish
# Recipe:: ohmyfish
#
# Author:: Gabor Pihaj
# Author:: Florian Peter | visalyze <florian.peter@visalyze.org>
#
node['fish']['ohmyfish']['install_for_users'].each do |current_user|
    bash "Install oh-my-fish" do
        user "#{current_user}"
        cwd "/home/#{current_user}"

        code <<-EOH
            mkdir -p .config/fish && touch .config/fish/config.fish
            git clone git://github.com/bpinto/oh-my-fish.git ./.oh-my-fish
            cp ./.oh-my-fish/templates/config.fish ./.config/fish/config.fish
        EOH

        not_if "test -d .oh-my-fish"
    end
end
