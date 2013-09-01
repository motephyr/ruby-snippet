# 需要 ANSI 終端機！
# 找出regex相符的字串
# 
# []	 指定的範圍（例如：[a-z] 表示一個在 a 到 z 的範圍內的字母）
# \w	 一般字元 (word character)，即 [0-9A-Za-z_]
# \W	 非一般字元 (non-word character)
# \s	 空白字元 (space character)，即 [ \t\n\r\f]
# \S	 非空白字元 (non-space character)
# \d	 數字 (digit character)，即 [0-9]
# \D	 非數字 (non-digit character)
# \b	 退位 (0x08)（僅用於指定的範圍）
# \b	 單字邊界（若不是於指定的範圍）
# \B	 非單字邊界
# *	 前一符號的內容出現 0 或數次。
# +	 前一符號的內容出現 1 或數次。
# {m,n}	 前一符號的內容，最少出現 m 次，最多出現 n 次。
# ?	 前一符號的內容最多出現一次，同 {0,1}
# |	 符合前一個或後一個表示式
# ()	 分組
# ^行首 $行尾

st = "\033[7m"
en = "\033[m"

puts "Enter an empty string at any time to exit."

while true
  print "str> "; STDOUT.flush; str = gets.chop
  break if str.empty?
  print "pat> "; STDOUT.flush; pat = gets.chop
  break if pat.empty?
  re = Regexp.new(pat)
  puts str.gsub(re,"#{st}\\&#{en}")
end
