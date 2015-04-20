#
# Cookbook Name:: REA-Sinatra
# Recipe:: default
#
# Copyright 2015, Mat Brennan
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
directory node['REA']['sinatra']['path'] do
  user node['REA']['sinatra']['user']
  group node['REA']['sinatra']['group']
  recursive true
  mode "0755"
  action :create
end

rbenv_ruby node['REA']['sinatra']['ruby_version'] do
  action :install
end

rbenv_gem "bundler" do
  rbenv_version node['REA']['sinatra']['ruby_version']
  action :install
end

execute "bundle install" do
  cwd node['REA']['sinatra']['path']
  user node['REA']['sinatra']['user']
  group node['REA']['sinatra']['group']
  command "bundle install"
  action :nothing
end
