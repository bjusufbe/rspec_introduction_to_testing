require './lib/calculator'

describe "Test case 1: Ability to add, multiply, subtract and divide two numbers" do
	before(:all) do
		@calculator = Calculator.new(10,10)
	end

	context "Add numbers" do
		it "adds two numbers" do
			result = @calculator.add
			expect(result).to eq(20)
		end
	end

	context "Multiply numbers" do
		it "multiplies two numbers" do
			result = @calculator.multiply
			expect(result).to eq(100)
		end
	end

	context "Subtract numbers" do
		it "subtracts two numbers" do
			result = @calculator.subtract
			expect(result).to eq(0)
		end
	end

	context "Divide numbers" do
		it "divides two numbers" do
			result = @calculator.divide
			expect(result).to eq(1)
		end
	end

	after(:all) do
		# do some cleanup
	end
end