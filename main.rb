module Enumerable 
	def my_each
		for i in 0...(self.length)
			yield(self[i])
		end
	end	

	def my_each_with_index
		for i in 0...self.length
		   yield(self[i], i)
		end
	end

	def my_select
		arr = []
		self.my_each {|item| arr.push(item) if yield(item) }
		return arr
	end

	def my_all?
		output = true
		self.my_each {|item| output = false unless yield(item)}
		return output
	end

	def my_any? 
		output = false
		self.my_each {|item| output = true if yield(item)}
	end
end






