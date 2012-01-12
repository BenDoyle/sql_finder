require 'find'
require 'treetop'

Treetop.load 'simple_sql'
parser = SimpleSQLParser.new
 
Find.find(ARGV[0]) do |f|
  if f.match(/\.coffee\Z/)
    puts
    
    pa = parser.parse('1+1+1')    
    
    puts pa.text_value
    
    puts "================================="
    puts f
    contents = File.read f
    matches = contents.downcase.gsub("\n"," ").scan(/"""(.+?)"""/)

#    matches = contents
    puts matches.size
    puts "================================="

    tables = matches.map do |match| 
      match.each do |m|
        
        tree = parser.parse m.downcase
        
        tree.text_value
        
        # puts m.downcase.scan(   /select.+?(from\s+([\w\.]+)\s+).+?(join\s+([\w\.]+)\s+.+?)+/   ).inspect
      end
    end
    
#    puts tables.inspect

#     unless matches.empty?
#       matches.each do |match|
# 
#         puts
# #        puts match.inspect
#         tables = match[0].downcase.scan(/(from|join)\s+([\w\.]+)\s+/)
# 
#         puts tables.map{|t|t[1]}.inspect
# 
#       end
#     end    
  end
end