require_relative '../lib/dark_trader'

describe "crypto" do
    it "return an array of all crypto with their prices" do
        expect(cryptocurrencies).to be_an(Array)
    end



    it "return the name of crypto" do  
     expect(cryptocurrencies).to include {"BTC"}
     expect(cryptocurrencies).to include {"ETH"}
     expect(cryptocurrencies).to include {"USDT"}
    end 

end