-- At here, i write some basic grammar about lua that different from `C Language`.

-- <String>
-- 1>
-- formatted string in lua
name = "nancy"
print(name.."botwin")

-- <Table>
-- in lua, table can used like array(idx start from 1) or map,
-- ipairs use (idx, value) form iterate array, pairs use (key, value) form iterate map.
arr = {1, 2, 3, 5, 7}
for i,v in ipairs(arr) do
	print("idx = "..i..", value = "..v)
end

dict = {name="nancy"}
dict.age = 17
for k,v in pairs(dict) do
	print("key:"..k..",value:"..v)
end