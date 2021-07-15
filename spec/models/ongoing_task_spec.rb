require 'rails_helper'
  describe OngoingTask, type: :model do
    context 'Associations' do
      it { should have_many(:votes) }
      it { should have_many(:helpers) }
      it { should have_many(:unfinished_tasks) }
      it { should have_many(:carotted_tasks) }
      it { should belong_to(:coloc_task) }
      it { should belong_to(:user).optional }
    end

    context 'Validations' do
      it "is valid with a coloc_task, a points ratio and final points" do
        coloc_task = create(:coloc_task)
        ongoing_task = OngoingTask.new(coloc_task: coloc_task, points_ratio: 1, final_points: 30)
        expect(ongoing_task).to be_valid
      end
      it "is invalid without a coloc_task" do
        ongoing_task = OngoingTask.new(coloc_task: nil)
        ongoing_task.valid?
        expect(ongoing_task.errors[:coloc_task]).to include('must exist')
      end
      it "is invalid without a points ratio" do
        ongoing_task = OngoingTask.new(points_ratio: nil)
        ongoing_task.valid?
        expect(ongoing_task.errors[:points_ratio]).to include('can\'t be blank')
      end
      it "is invalid without final points" do
        ongoing_task = OngoingTask.new(final_points: nil)
        ongoing_task.valid?
        expect(ongoing_task.errors[:final_points]).to include('can\'t be blank')
      end
    end
  end
