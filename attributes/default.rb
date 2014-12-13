default[:hastebin][:user]    = 'root'
default[:hastebin][:group]   = 'root'
default[:hastebin][:host]    = '0.0.0.0'
default[:hastebin][:port]    = 7777
default[:hastebin][:storage] = {
  path: './data',
  type: 'file'
}
