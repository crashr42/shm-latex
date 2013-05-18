#!/usr/bin/ruby

Dir.entries('.').each do |entry|
    next if !File.file?(entry) || File.extname(entry) != '.png'
    base_name = File.basename(entry, '.*')
    puts "Converting #{base_name} ..."
    `convert -flatten #{entry} #{base_name}.new.png`
    `./png2eps #{entry} > #{base_name}.eps`
end
