require 'rails_helper'

describe User, type: :model do
    context 'Associations' do
        it { should have_many(:colocs) }
        it { should have_many(:ongoing_tasks) }
        it { should have_many(:carotted_tasks) }
        it { should have_many(:unfinished_tasks) }
        it { should have_many(:votes) }
        it { should have_many(:helpers) }
    end

    context 'Validations' do
        it "is valid with a username, email, and a password" do
            user = User.create(username: "Toto", email: "toto@gmail.com", password: "azerty")
            expect(user).to be_valid
        end
        it "is invalid without a name" do
            user = User.new(username: nil)
            user.valid?
            expect(user.errors[:username]).to include('can\'t be blank')
        end
        it "is invalid with a name with special characters" do
            user = User.new(username: "+us'er*69")
            user.valid?
            expect(user.errors[:username]).to include('only letters and digits')
        end
        it "is invalid with a too short name" do
            coloc69004 = Coloc.new(name: "a")
            coloc69004.valid?
            expect(coloc69004.errors[:name]).to include('is too short (minimum is 2 characters)')
        end
    end
end
