#!/usr/bin/env ruby

require 'fileutils'

Dir.foreach("html") do |name|
  unless name.match(/\.+/)
    FileUtils.mv(File.join("html", name, "index.html"),
                 File.join("html", "#{name}.html")
                 )
    FileUtils.rmdir(File.join("html", name))
  end
end
