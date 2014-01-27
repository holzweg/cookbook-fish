fish Cookbook
=============
Installs/configure fish shell
NOTE: Will not improve your cooking skills on either Actinopterygii or Crustacea.

http://fishshell.com/

Requirements
------------

- build-essential
- libncurses5-dev

Attributes
----------

- default['fish']['install_method'] - install method, default: "package"
- default['fish']['src_dir'] - src directory, default: "/usr/src"
- default['fish']['release'] - release version, default: "2.1.0"

Usage
-----

Just include `fish` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[fish]"
  ]
}
```

Optional custom fish functions
-----

1. Include the recipe `fish::functions`
2. Specify any users that you want the functions to be installed for in attribute default['fish']['functions']['install_for_users'] = ['joe','blow','chuck']
3. Copy your custom .fish files under files/default/functions in this recipe. Voilà.


Optional oh-my-fish Installation
-----

If you wish to install the awesome oh-my-fish (https://github.com/bpinto/oh-my-fish),
then specify the users you would like to be oh-my-fished as an array in

- default['fish']['ohmyfish']['install_for_users']

and include the recipe `fish::ohmyfish`

WARNING: Existing .config/fish/fish.config in the home directories of these users will be overwritten.
