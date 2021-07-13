require 'rails_helper'

describe User, type: :model do
    context 'Associations' do
        it { should belong_to(:coloc).optional }
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
        it "is invalid without a username" do
            user = User.new(username: nil)
            user.valid?
            expect(user.errors[:username]).to include('can\'t be blank')
        end
        it "is invalid with a username with special characters" do
            user = User.new(username: "+us'er*69")
            user.valid?
            expect(user.errors[:username]).to include('only letters and digits')
        end
        it "is invalid with a too short username" do
            user = User.new(username: "a")
            user.valid?
            expect(user.errors[:username]).to include('is too short (minimum is 3 characters)')
        end
        it "is invalid with a too long username" do
            user = User.new(username: "Unsuperlongnomdeusermaisvraimenttrèstrèstrèslong")
            user.valid?
            expect(user.errors[:username]).to include('is too long (maximum is 15 characters)')
        end
        it "is invalid if username is already taken" do
            user = create(:user, username: "SuperUser")
            user_duplicated = build(:user, username: "SuperUser")
            user_duplicated.valid?
            expect(user_duplicated.errors[:username]).to include('has already been taken')
        end
    end
end
