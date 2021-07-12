require 'rails_helper'
describe User, type: :model do
    # context 'Associations' do
    #     it { should have_many(:projects) } 
    #     it { should have_many(:workshop_bookings) } 
    # end
    context 'Validations' do
        it "is valid with a name, email, and a  password" do
            user = User.create(name: "Jean",
                                email: "jkrupa@hot.fr",
                                password: "azerty")
            p user
            expect(user).to be_valid
        end
        it "is invalid without a name" do
            user = User.new(name: nil)
            user.valid?
            p user.errors[:name]
            expect(user.errors[:name]).to include('can\'t be blank')
        end
    end

    context 'methods' do 
        it "is suppose to respond toto" do 
            user = create(:user)
            expect(user.full_name).to eq("toto")
        end
        
    end
end
