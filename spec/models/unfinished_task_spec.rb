require 'rails_helper'
describe UnfinishedTask, type: :model do
  context 'Associations' do
    it { should belong_to(:ongoing_task) }
    it { should belong_to(:user) }
  end

  after(:each) do
    I18n.locale = :en
  end
  
  context 'Validations' do
    it "is valid with an ongoing_task and a user" do
      ongoing_task = create(:ongoing_task)
      user = create(:user)
      unfinished_task = UnfinishedTask.new(ongoing_task: ongoing_task, user: user)
      expect(unfinished_task).to be_valid
    end
    it "is invalid without an ongoing_task" do
      unfinished_task = UnfinishedTask.new(ongoing_task: nil)
      unfinished_task.valid?
      expect(unfinished_task.errors[:ongoing_task]).to include('must exist')
    end
    it "is invalid without a user" do
      unfinished_task = UnfinishedTask.new(user: nil)
      unfinished_task.valid?
      expect(unfinished_task.errors[:user]).to include('must exist')
    end
  end
end
