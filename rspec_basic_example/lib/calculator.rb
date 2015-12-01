class Calculator
	attr_accessor :num_a, :num_b

	def initialize(a, b)
		@num_a = a
		@num_b = b
	end

	def add
		@num_a + @num_b
	end

	def subtract
		@num_a - @num_b
	end

	def multiply
		@num_a * @num_b
	end

	def divide
		@num_a / @num_b
	end
end