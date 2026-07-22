str = "あいうえお"
array = str.split("")
b = ""
array.each do |a|
  b = b +  a
  puts b
  sleep 0.5
end
