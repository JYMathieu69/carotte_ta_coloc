require 'rails_helper'
describe CarottedTask, type: :model do
  context 'Associations' do
    it { should belong_to(:ongoing_task) }
    it { should belong_to(:user) }
    it { should belong_to(:carotted_user) }
  end

  after(:each) do
    I18n.locale = :en
  end

  context 'Validations' do
    it "is valid with an ongoing_task, a user, and a carotted_user" do
      ongoing_task = create(:ongoing_task)
      user = create(:user)
      carotted_user = create(:carotted_user)
      carotted_task = CarottedTask.new(ongoing_task: ongoing_task, user: user, carotted_user: carotted_user)
      expect(carotted_task).to be_valid
    end

    it "is invalid without an ongoing_task" do
      carotted_task = CarottedTask.new(ongoing_task: nil)
      carotted_task.valid?
      expect(carotted_task.errors[:ongoing_task]).to include('must exist')
    end

    it "is invalid without a user" do
      carotted_task = CarottedTask.new(user: nil)
      carotted_task.valid?
      expect(carotted_task.errors[:user]).to include('must exist')
    end

    it "is invalid without a carotted_user" do
      carotted_task = CarottedTask.new(carotted_user: nil)
      carotted_task.valid?
      expect(carotted_task.errors[:carotted_user]).to include('must exist')
    end

    it "is invalid if carotted_user and user are the same" do
      user = create(:user)
      carotted_task = CarottedTask.new(user: user, carotted_user: user)
      carotted_task.valid?
      expect(carotted_task.errors[:carotted_user]).to include('can\'t be the same as user')
    end
  end
end
