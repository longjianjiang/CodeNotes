# At here, i write some basic grammar about ruby that different from `C Language`

# <String>
# 1>
# formatted string in ruby
name = "longjianjiang"
puts "My name is #{name}"

# 2>
# in ruby string default is reference type
# so if you don't want change original string you should use `clone` method to pass a copy to another variable.
str1 = "longjianjiang"
str2 = str1
str3 = str1.clone

str2.insert(0, "My name is ")
puts "str = #{str1}, str2 = #{str2}, str3 = #{str3}" # when str2 change, str1 also be changed, but str3 is str1's copy version, so str3 won't be changed

# <Method>
# 1>
# `tap`, i think tap is like a `block`, receive a variable is its caller, then in block do something about caller, finally return caller.
class Person
	attr_accessor :name, :age
end

person = Person.new.tap do |p|
	p.name = "longjianjiang"
	p.age = 57
end

puts person.inspect # like OC `description`, `inspect` can display what object contains

