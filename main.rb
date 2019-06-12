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

  def my_map(proc=nil)
    	arr = []
    	if proc == nil
    	   self.my_each_with_index{ | element, index | arr << yield(element)}
    	else
    		self.my_each_with_index { |element, index| arr << proc.call(element)}
    	end
    	return arr
    end

    def my_inject(initial = nil)
      
      if initial == nil 
        accumulator = self.first
      else
        accumulator = initial
      end

      self.my_each {|element| accumulator = yield(accumulator,element)} 
      return accumulator
    end
end


def multiply_els(numberList)
  return numberList.my_inject(1) { |acc, number| acc*number}
end


# var1 = multiply_els([2,8,10])
# p var1


#  arg = Proc.new{|i| i * i}
#  p var2 = [1, 2, 4, 7, 9].my_map(arg)

#  p ["a", "b", "c", "d", "e", "f"].my_map{|a|  a.upcase}

# p (5..10).inject { |sum, n| sum + n }  
# p (5..10).inject(1) { |product, n| product * n }

# longest = %w{ cat sheep bear }.inject do |memo, word|
#    memo.length > word.length ? memo : word
# end
# p longest 
