fish Cookbook
=============
Installs/configure fish shell
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
