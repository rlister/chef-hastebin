# Hastebin Cookbook

Installs [hastebin](https://github.com/seejohnrun/haste-server).

## Requirements

### packages

```ruby
depends "git"
depends "nodejs"
```

## Attributes

| Key                   | Type   | Description              | Default |
|-----------------------|--------|--------------------------|---------|
| `[:hastebin][:user]`  | string | user to run the service  | `root`  |
| `[:hastebin][:group]` | string | group to run the service | `root`  |

## Usage

Just include `hastebin` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[hastebin]"
  ]
}
```
