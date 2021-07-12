require 'rails_helper'
describe User, type: :model do
    context 'Associations' do
        it { should have_many(:projects) } 
        it { should have_many(:workshop_bookings) } 
    end
    context 'Validations' do
        it "is valid with a first name, last name, email, and a balance password" do
            user = User.create(first_name: "Jean",
                                last_name: "Krupa",
                                email: "jkrupa@hotmail.fr",
                                phone_number: "0695500784",
                                password:"azerty")
            expect(user).to be_valid
        end
        it "is invalid without a first name" do
            user = User.new(first_name: nil)
            user.valid?
            expect(user.errors[:first_name]).to include('can\'t be blank')
        end
    end
end
