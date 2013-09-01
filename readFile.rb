#將檔案轉換成所需的結果

filename = ARGV[0]

print "regex> "; regex = STDIN.gets.chop
print "replace> "; replace = STDIN.gets.chop

file = open(filename)
str = "";

while text = file.gets
  re = Regexp.new(regex)
  text.gsub!(re,replace)
  str = str + text
end
io=File.open(filename+".new","w")
io.write(str)
file.close
