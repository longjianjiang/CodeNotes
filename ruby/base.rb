# At here, i write some basic grammar about ruby that different from `C Language`

# in ruby while loop will not treat zero is false, so the following code will cause endless loop.
# while Array.new().length()
# 	puts "======="
# end

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

# 3>
# in ruby get a substring have two methods
substring1 = str3[8,5] # this version mean substring index start from 8, and substring length is 5
substring2 = str3[8..12] # this version mean substring index end from 8 to 12
puts "substring1 = #{substring1}, substring2 = #{substring2}"

# 4>
# in ruby use `sub`, `gsub`, `sub!`, `gsub!` method replace characters in a string based on a Regexp.
# `sub` replaces only the first match, `gsub` replaces all matches. if not match just return original string.
# `sub!` and `gsub!` do same thing, but also change original string with replaced string when match sucess.
need_replace_str = "b0j"
puts need_replace_str.sub(/[0-9]/, "$")
puts need_replace_str.gsub(/[0-9]/, "$")

# <Array>
# 1>
# in td_arr_1, change one of item will affect all array in two dimensional array.
td_arr_1 = Array.new(2, Array.new(2, 0))
td_arr_2 = Array.new(2) { Array.new(2, 0) }
td_arr_1[0][0] = 1
td_arr_2[0][0] = 1
puts td_arr_1.inspect
puts td_arr_2.inspect


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

# 2>
# `<=>`, this method is used to determine the relationship between two values
# if left > right, thie method return 1; if left == right, this method return 0; otherwise return -1.
# so this method can use in `case` statement.

# 3>
# `bsearch`, this method can use in Array, use binary search to improve time complexity.
# so when your care about method run time, your should use `bsearch` instead of `find`.
# `bsearch` uses block's result as a hint which part of array (left or right side) should be chosen for searching on next iteration. 
# If block returns 0 it will stop searching, return result.
# If it returns less then 0 it will go left otherwise it goes right 
# finally, it find target return target, otherwise return nil
list = [0, 0, 1, 2]
puts list.bsearch { |i| 2 <=> i } # must put target left of the spaceship

# 4>
# `times`, integer can call this method, behave like for loop, receive a block, repeat execute block multiple times.
2.times do 
	puts "repeat log content"
end 
3.times { puts "repeat log content again"}

# 5>
# `nil?`, this method can can determine if an object is null
# nil in ruby is a instance of class `NilClass`, like the common error we see:
# <undefined method `val' for nil:NilClass (NoMethodError)>

# 6>
# `empty?`, in ruby, String, Hash, Array can use this method to determine if an object is empty.

# 7>
# in ruby, function parameters passing is reference copy, so how can we implement like cpp `reference parameters`
# for example, we need to write a function to swap two number's value, in ruby we will use `eval` and `binding`
def swap(a, b, vars)
	tmp = a
	eval "a = b", vars
	eval "b = #{tmp}", vars

	# a will be a's value, b will be b's value
	# cause this execute environment is different from binding encapsulated environment
	# so at binding encapsulated environment, a will be b's value, b will be a's value
	# because eval exe "a = ..", "b = ..", so you pass parameter name must equal a or b, otherwise it will not work.
	puts a 
	puts b
end

a, b = 5, 7
swap(a, b, binding)
puts "a = #{a}, b = #{b}"

swap_a, swap_b = 1, 2
swap(swap_a, swap_b, binding)
puts "swap_a = #{swap_a}, swap_b = #{swap_b}"
puts "============================================"
# as we can see, this version of swap only work when parameters name as same as function parameters's name.
# i print value in swap method, you will see, function parameter's value didn't change at all.
# why? `eval "a = b", binding`;
# `eval` can execute a string as a regular statement at current environment, and return as result. eval also can have second parameter like binding.
# `binding` can encapsulate execution context at some particular place in the code and retain this context for future use,
# so, eval can receive a binding parameter,it indicates that the environment for this execution is the environment of the function caller, as same as `binding` encapsulated environment.
def swap_version2(a, b, vars)
	old_a = eval a, vars
	old_b = eval b, vars
    eval "#{a} = #{old_b}", vars
	eval "#{b} = #{old_a}", vars
	
	# this method parameter type is String
	# eval use #{}, eval "#{a} = ..", "#{b} = ..", so parameter name can be any other string. 
	puts a 
	puts b
end 
num1, num2 = 10, 20
swap_version2("num1", "num2", binding)
puts num1
puts num2

p = 5
q = 7
eval "p = q", binding
puts p 
puts q 

# 8>
# `sort`, we can use `sort` method sort a list using custom sort rule.
before_sort_list = [3,30,34,5,9]
f = ->(a, b) { a <=> b }
cf = ->(a, b) { b + a <=> a + b }
after_sort_list = before_sort_list.sort(&f)
custom_sort_list = before_sort_list.map(&:to_s).sort(&cf)
puts before_sort_list.inspect
puts after_sort_list.inspect
puts custom_sort_list.inspect
# f is like cpp `compare` method, tell sort method sort rule. but in ruby use `<=>` method instead of return bool.

# 9>
# `map`, we can use `map` method to make list item make change.
mf = ->(num) { num.to_s }
after_map_list = before_sort_list.map(&mf) #before_sort_list.map(&:to_s) #before_sort_list.map { |num| num.to_s }
puts after_map_list.inspect
# & is represent block's parameter |num| 
# &mf => as same as `sort` compare parameter
# &: =>  as same as num.to_s


# <Range>
# 0..2 mean range from 0 to 2
# 0...2 mean range from 0 ro 1

# <Regular Expression>
# in ruby we write regular expression like `/[a-zA-Z0-9]/`, string inside // should be escaped.
# we can use operator `=~` or `match` method to do pattern matching, the order of string and Regexp do not matter.
# 1> `=~` will return index of first match in string, otherwise will nil.
# 2> match will return a `MatchData` object like Array that contain one match result, otherwise will nil.
# in ruby string's match method use regular expression to do match thing.
# if match method returns a value, the operation succeeded. Otherwise, will return nil.
single_char_str = "-"
reg_exp_1 = "57".match(/[a-zA-Z0-9]/) # this regular expression use to match a single char is alphanumeric characters
reg_exp_2 = "57" =~ /[a-zA-Z0-9]/
puts reg_exp_1
puts reg_exp_2


# <Other>
# <1> script related
# we want to execute ruby script like sheel script, just take the following steps

# 1> add this line

#!/usr/bin/env ruby

# 2> write your ruby code, if you want to run sheel command like git, you just `sheel command`

# puts "enter commit message"
# commit_msg = gets.chomp
# commit_command = "git commit -m '#{commit_msg}' "

# `git add .`
# `#{commit_command}`
# `git push origin master`


# 3> run command make ruby script as a executable file, just run ./test.rb

# chmod +x test.rb
