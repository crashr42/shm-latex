#!/usr/bin/ruby

Dir.entries('.').each do |entry|
    next if !File.file?(entry) || File.extname(entry) != '.png'
    puts "Converting #{File.basename(entry, '.*')} ..."
    `convert -colorspace Gray -flatten #{entry} #{entry}`
    `./png2eps #{entry} > #{File.basename(entry, '.*')}.eps`
end
