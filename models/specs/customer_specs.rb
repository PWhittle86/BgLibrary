require('minitest/autorun')
require('minitest/rg')
require_relative('../customer')

class Test_customer < Minitest::Test

  def setup
    customer_hash = {"first_name" => "Peter",
      "last_name" => "Whittle",
      "age" => 31,
    "gender" => "Male",}

    @customer1 = Customer.new(customer_hash)
  end

   def test_first_name #Checks whether the first_name field is being correctly populated.
     result = @customer1.first_name
     assert_equal("Peter", result)
   end

   def test_last_name #Checks whether the last_name field is being correctly populated.
     result = @customer1.last_name
     assert_equal("Whittle", result)
   end

   def test_age #Checks whether the age field is being correctly populated.
     result = @customer1.age
     assert_equal(31, result)
   end

   def test_gender #Checks whether the gender field is being correctly populated.
     result = @customer1.gender
     assert_equal("Male", result)
   end


end
