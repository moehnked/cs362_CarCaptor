require 'rails_helper'

RSpec.describe Garage, type: :model do
    garage = Garage.new
    garage.setup

    it "expects a new garage to have no cars" do
    	expect(garage.cars.length).to eq(0) 
    end

    it "expects a garage with no cars to be lame" do
    	expect(garage).to be_lame
    end

    describe "adding cars" do
    	it "keeps track of the number of cars added" do
    		garage.add(Car.new)
    		expect(garage.cars.length).to eq(1)
            garage.add
            expect(garage.cars.length).to eq(2)
            expect(garage.count_cars).to eq(2)
    	end

      it "expects a garage with at least one car with a positive coolness value to not be lame" do
        expect(garage).to_not be_lame
      end
    end

    # describe "slow test" do
    #     it "can make a call to a contrived dependancy" do
    #         expect(garage.perform(BigDependency.new)).to eq(42)
    #     end
    # end

    describe "faster test" do
        it "can make a thing respond to execute in place of a real BigDependency object" do
            mockBigDependency = BigDependency.new
            #this will override the method execute in our mock object to only return 42, essentially skipping the sleep(5)
            allow(mockBigDependency).to receive(:execute).and_return(42)
            #this allows us to change the behavior of a class without the cumbersome convolution of subclass and override
            #the class is unaffected, as an alternate object of the same class created later will still maintain the original response to execute, sleep and all
        #    othermockBigDependency = BigDependency.new
            #alternating between the two mocks verifies this

            expect(garage.perform(mockBigDependency)).to eq(42)
        end
    end
end
