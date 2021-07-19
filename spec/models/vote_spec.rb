require 'rails_helper'
describe Vote, type: :model do
    context 'Associations' do
            it { should belong_to(:ongoing_task) }
            it { should belong_to(:user) }
    end
    context 'Validations' do
        it "is valid with an ongoing_task, a user, and an answer ('validated' column)" do
            ongoing_task = create(:ongoing_task)
            user = create(:user)
            vote = Vote.new(ongoing_task: ongoing_task, user: user, validated: false)
            expect(vote).to be_valid
        end
        it "is invalid without an ongoing_task" do
            vote = Vote.new(ongoing_task: nil)
            vote.valid?
            expect(vote.errors[:ongoing_task]).to include('must exist')
        end
        it "is invalid without a user" do
            vote = Vote.new(user: nil)
            vote.valid?
            expect(vote.errors[:user]).to include('must exist')
        end
        it "is invalid without an answer ('validated' column)" do
            vote = Vote.new(validated: nil)
            vote.valid?
            expect(vote.errors[:validated]).to include('is not a boolean')
        end
    end
end
