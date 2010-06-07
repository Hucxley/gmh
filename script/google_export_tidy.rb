#!/usr/bin/env ruby

require 'fileutils'

base_path = ARGV[0]
puts base_path

Dir.foreach(File.join(base_path, "html")) do |name|
  unless name.match(/\.+/)
    FileUtils.mv(File.join(base_path, "html", name, "index.html"),
                 File.join(base_path, "html", "#{name}.html")
                 )
    FileUtils.rmdir(File.join(base_path, "html", name))
  end
end
