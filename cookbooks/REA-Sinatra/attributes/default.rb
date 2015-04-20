default['REA']['sinatra']['user'] = node['REA']['user']
default['REA']['sinatra']['group'] = node['REA']['group']
default['REA']['sinatra']['path'] = ::File.join(node['REA']['home'], "sinatra")
default['REA']['sinatra']['ruby_version'] = "2.2.2"
