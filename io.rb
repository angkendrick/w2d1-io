

# part 1 - create file
# fname = "sample.txt"
# someFile = File.open(fname, "w")
# someFile.puts "Hello file!"
# someFile.close

# part 2 - copy from url and write to file
# require 'open-uri'
# remote_base_url = "https://en.wikipedia.org/wiki"
# remote_page_name = "Ruby_(programming_language)"
# remote_full_url = remote_base_url + "/" + remote_page_name

# remote_data = open(remote_full_url).read
# my_local_file = open("my-downloaded-page.html", "w")

# my_local_file.write(remote_data)
# my_local_file.close

# part 3 - one line create and write
# File.open("sample.txt", "w") { |somefile| somefile.puts "Hello file!"}

# part 4 - copy from url and write to file
# require 'rubygems'
# require 'rest-client'

# wiki_url = "http://en.wikipedia.org/"
# wiki_local_filename = "wiki-page.html"

# File.open(wiki_local_filename, "w") do |file|
# 	file.write(RestClient.get(wiki_url))
# end

# # part 5 - read file
# file = File.open("sample.txt", "r")
# contents = file.read
# puts contents

# contents = file.read
# puts contents #=> " " first puts already puts the file

# part 6 - one block read
# contents = File.open("sample.txt", "r") { |file| file.read }
# puts contents

# part 7 - readlines
# File.open("sample.txt").readlines.each do |line|
# 	puts line
# end

# part 8 - readline
# file = File.open("sample.txt", 'r')
# while !file.eof?
# 	line = file.readline
# 	puts line
# end

# part 9 - hamlet exercise
# require 'open-uri'
# url = "http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt"
# local_fname = "hamlet.txt"
# File.open(local_fname, "w") { |file| file.write(open(url).read)}

# File.open(local_fname, "r") do |file|
# 	file.readlines.each_with_index do |line, idx|
# 		puts line if idx % 42 == 41
# 	end
# end

# part 10 - reading and regex
# lines = ["Hello world", "  How are you?", "*Fine*, thank you!.", "  OK then."]
# lines.each do |line|
# 	puts line if line.match(/^  [A-Z]/)
# end

# part 11 - reading hamlet with regex and match
# is_hamlet_speaking = false
# File.open("hamlet.txt", "r") do |file|
# 	file.readlines.each do |line|

# 		if is_hamlet_speaking == true && (line.match(/^  [A-Z]/) || line.strip.empty?)
# 			is_hamlet_speaking = false
# 		end

# 		is_hamlet_speaking = true if line.match("Ham\.")

# 		puts line if is_hamlet_speaking == true
# 	end
# end

# part 12 - checking if file exists
# dirname = "data-files"
# Dir.mkdir(dirname) unless File.exists?dirname
# File.open("#{dirname}/new-file.txt", 'w') { |f| f.write('Hello world!')}

# part 13 - counting files using Dir class
# puts Dir.glob('Downloads/*').length
# or
# puts Dir.glob('Downloads/*.{pdf,PDF}').join(",\n")

# part 14 - finding the 10 largest files
# DIRNAME = "./"
# Dir.glob("#{DIRNAME}/**/*.*").sort_by{ |fname| File.size(fname)}.reverse[0..9].each do |fname|
# 	puts "#{fname}\t#{File.size(fname)}"
# end

# part 15 - determine file makeup of directories and print to spreadsheet
# DIRNAME = "./"

# hash = Dir.glob("#{DIRNAME}/**/*.*").inject({}) do |hsh, fname|
#    ext = File.basename(fname).split('.')[-1].to_s.downcase
#    hsh[ext] ||= [0,0]
#    hsh[ext][0] += 1
#    hsh[ext][1] += File.size(fname)   
#    hsh
# end               
# File.open("file-analysis.txt", "w") do |f|
#    hash.each do |arr|
#      txt = arr.flatten.join("\t")
#       f.puts txt
#       puts txt
#    end
# end