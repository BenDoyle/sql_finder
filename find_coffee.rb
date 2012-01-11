require 'find'
 
Find.find(ARGV[0]) do |f|
  if f.match(/\.coffee\Z/)
    puts
    puts "================================="
    puts f
    contents = File.read f
    matches = contents.downcase.gsub("\n"," ").scan(/"""(.+?)"""/)

#    matches = contents.downcase.scan(/(from|join)\s+([\w\.]+)\s+/)
    puts matches.size
    puts "================================="
    unless matches.empty?
      matches.each do |match|
        puts
        puts match.inspect
      end
    end    
  end
end