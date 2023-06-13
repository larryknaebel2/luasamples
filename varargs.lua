function average(...)
   result = 0
   local arg = {...}
   for i,v in ipairs(arg) do
      result = result + v
	  --print(i)
   end
   print("Number of params "..#arg)
   return result/#arg
end

--print("The average is",average(10,5,3,4,5,6))
print("The average is",average(10,5,3,4,5,6,34,21,99))