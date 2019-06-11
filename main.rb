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
		return output
	end

	def my_none?
		output = true
		self.my_each { | item | output = false if yield(item) }
		return output
	end

	def my_count(item = nil)
      count = 0
      if item != nil
        self.my_each{ |element| count += 1 if element == item }
      elsif block_given?
        self.my_each{ |element| count += 1 if yield(element)}
      else
        count = self.length 
      end
      return count
    end

    def my_map
    	arr = []
    	self.my_each{ | element | arr << yield(element)}
    	return arr
    end
end







