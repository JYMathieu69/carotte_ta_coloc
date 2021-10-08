require 'rails_helper'
describe Helper, type: :model do
context 'Associations' do
        it { should belong_to(:ongoing_task) } 
        it { should belong_to(:user) } 
end

after(:each) do
    I18n.locale = :en
    end

  context 'Validations' do
    it 'is valid with and assigned ongoing_task and a user' do
        helper_user = create(:user, username: 'helper', email: 'helper@gmail.com')
        task_creator = create(:user, username: 'taskcreator', email: 'taskcreator@gmail.com')
        ongoing_task = create(:ongoing_task, user: task_creator)
        helper = Helper.new(user: helper_user, ongoing_task: ongoing_task)
        expect(helper).to be_valid
    end

    it 'is invalid without user' do
      task_creator = create(:user, username: 'taskcreator', email: 'taskcreator@gmail.com')
      ongoing_task = create(:ongoing_task, user: task_creator)
      helper = Helper.new(user: nil, ongoing_task: ongoing_task)
      expect(helper).not_to be_valid
    end

    it 'is invalid without oingoing task' do
      helper_user = create(:user, username: 'helper', email: 'helper@gmail.com')
      task_creator = create(:user, username: 'taskcreator', email: 'taskcreator@gmail.com')
      ongoing_task = create(:ongoing_task, user: task_creator)
      helper = Helper.new(user: helper_user, ongoing_task: nil)
      expect(helper).not_to be_valid
    end

    it 'is invalid if helper is ongoing_task.user' do
      task_creator = create(:user, username: 'taskcreator', email: 'taskcreator@gmail.com')
      ongoing_task = create(:ongoing_task, user: task_creator)
      helper = Helper.new(user:task_creator, ongoing_task: ongoing_task)
      expect(helper).not_to be_valid
    end

    it 'is invalid if ongoing_task is not assigned' do
      unassigned_ongoing_task = create(:ongoing_task)
      helper_user = create(:user, username: 'helper', email: 'helper@gmail.com')
      helper = Helper.new(user: helper_user, ongoing_task: unassigned_ongoing_task)
      expect(helper).not_to be_valid
    end

    it 'is invalid if user helps more than once for the same task' do
      task_creator = create(:user, username: 'taskcreator', email: 'taskcreator@gmail.com')
      ongoing_task = create(:ongoing_task, user: task_creator)
      helper_user = create(:user, username: 'helper', email: 'helper@gmail.com')
      helper = Helper.create(user: helper_user, ongoing_task: ongoing_task)
      same_helper = Helper.new(user: helper_user, ongoing_task: ongoing_task)
      expect(same_helper).not_to be_valid
    end
  end


end