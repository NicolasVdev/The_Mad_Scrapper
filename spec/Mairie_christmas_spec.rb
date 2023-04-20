require_relative '../lib/Mairie_christmas'

describe "Mairie Christmas" do
    it "return an array of all Townn with their mail" do
        expect(perform).to be_an(Array)
    end



    it "return the name of town and their mails " do  
     expect(perform).to include {"HERBLAY"}
     expect(perform).to include {"LA FRETTE SUR SEINE"=>"mairie@ville-la-frette95.fr"}
     expect(perform).to include {"CORMEILLES EN PARISIS"=>"contact@ville-cormeilles95.fr"}
     expect(perform).to include {"mairie@herblay.fr"}
    end 

end