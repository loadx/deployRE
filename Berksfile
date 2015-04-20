source 'https://supermarket.chef.io'

current_dir = File.dirname(__FILE__)
cookbook_dir = File.join(current_dir, "cookbooks")

local_cookbooks = Dir[File.join(cookbook_dir,'*','metadata.rb')].map do |cookbook_metadata|
  File.dirname(cookbook_metadata).split(File::SEPARATOR).last
end.each do |cookbook|
  cookbook cookbook, path: File.expand_path(File.join(cookbook_dir, cookbook))
end
