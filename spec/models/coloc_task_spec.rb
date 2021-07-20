require 'rails_helper'
describe ColocTask, type: :model do
    context 'Associations' do
            it { should belong_to(:task) }
            it { should belong_to(:coloc) }
    end
    context 'Validations' do
        it "is valid with a coloc, task, difficulty and points" do
            coloc = create(:coloc)
            task = create(:task)
            coloc_task = ColocTask.new(task: task, coloc: coloc, difficulty: 2, points: 30)
            expect(coloc_task).to be_valid
        end
        it "is invalid without a coloc" do
            coloc_task = ColocTask.new(coloc: nil)
            coloc_task.valid?
            expect(coloc_task.errors[:coloc]).to include('must exist')
        end
        it "is invalid without a task" do
            coloc_task = ColocTask.new(task: nil)
            coloc_task.valid?
            expect(coloc_task.errors[:task]).to include('must exist')
        end
        it "is invalid without a difficulty" do
            coloc_task = ColocTask.new(difficulty: nil)
            coloc_task.valid?
            expect(coloc_task.errors[:difficulty]).to include('can\'t be blank')
        end
        it "is invalid without points" do
            coloc_task = ColocTask.new(points: nil)
            coloc_task.valid?
            expect(coloc_task.errors[:points]).to include('can\'t be blank')
        end
        it "is invalid if points are a string" do
            coloc_task = ColocTask.new(points: "45a")
            coloc_task.valid?
            expect(coloc_task.errors[:points]).to include('is not a number')
        end
        it "is invalid if points are a float " do
            coloc_task = ColocTask.new(points: 15.5)
            coloc_task.valid?
            expect(coloc_task.errors[:points]).to include('must be an integer')
        end
        it "is invalid if points are less than 0 " do
            coloc_task = ColocTask.new(points: -1)
            coloc_task.valid?
            expect(coloc_task.errors[:points]).to include('must be greater than or equal to 1')
        end
        it "is invalid if difficulty is greater than 4 " do
            coloc_task = ColocTask.new(difficulty: 8)
            coloc_task.valid?
            expect(coloc_task.errors[:difficulty]).to include('must be less than or equal to 4')
        end
        it "is invalid if difficulty is less than 1 " do
            coloc_task = ColocTask.new(difficulty: 0)
            coloc_task.valid?
            expect(coloc_task.errors[:difficulty]).to include('must be greater than or equal to 1')
        end

        it "is invalid if difficulty is a string" do
            coloc_task = ColocTask.new(difficulty: "4a")
            coloc_task.valid?
            expect(coloc_task.errors[:difficulty]).to include('is not a number')
        end
        it "is invalid if difficulty is a float " do
            coloc_task = ColocTask.new(difficulty: 1.5)
            coloc_task.valid?
            expect(coloc_task.errors[:difficulty]).to include('must be an integer')
        end
        it "is invalid if coloc/task is duplicated" do
            coloc = create(:coloc)
            task = create(:task)
            coloc_task = create(:coloc_task, coloc: coloc, task:task)
            duplicated_coloc_task = build(:coloc_task, coloc: coloc, task:task)
            expect(duplicated_coloc_task).not_to be_valid
            duplicated_coloc_task.valid?
            expect(duplicated_coloc_task.errors[:coloc]).to include('no duplicated tasks in a coloc')
        end
    end
end
