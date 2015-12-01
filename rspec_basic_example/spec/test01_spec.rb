require './lib/calculator'

calculator = Calculator.new(10,10)

describe "Add numbers" do
	it "adds two numbers" do
		result = calculator.add
		expect(result).to eq(20)
	end
end

describe "Multiply numbers" do
	it "multiplies two numbers" do
		result = calculator.multiply
		expect(result).to eq(100)
	end
end

describe "Subtract numbers" do
	it "subtracts two numbers" do
		result = calculator.subtract
		expect(result).to eq(0)
	end
end

describe "Divide numbers" do
	it "divides two numbers" do
		result = calculator.divide
		expect(result).to eq(1)
	end
end