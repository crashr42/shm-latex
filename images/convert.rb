#!/usr/bin/ruby

puts "Clean files"
`rm -rf *.new.png`
`rm -rf *.eps`
`rm -rf *.pdf`

Dir.entries('.').each do |entry|
    next if !File.file?(entry) || File.extname(entry) != '.png'
    base_name = File.basename(entry, '.*')
    puts "Converting #{base_name} ..."
    `convert -flatten #{entry} #{base_name}.new.png`
    `./png2eps #{entry} > #{base_name}.eps`
end
