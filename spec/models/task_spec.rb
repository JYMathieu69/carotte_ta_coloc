require 'rails_helper'

describe Task, type: :model do
    context 'Associations' do
        it { should have_many(:coloc_tasks) }
    end
    context 'Validations' do
        it "is valid with a name, description, recurrence, auto_assigned, and default_difficulty" do
            task = Task.create(name: "Aspi", description: "Aspi is good for the health", recurrence: "weekly", auto_assigned: true, default_difficulty: 3)
            expect(task).to be_valid
        end
        it "is invalid without a name" do
            task = Task.new(name: nil)
            task.valid?
            expect(task.errors[:name]).to include('can\'t be blank')
        end
        it "is invalid without a description" do
            task = Task.new(description: nil)
            task.valid?
            expect(task.errors[:description]).to include('can\'t be blank')
        end
        it "is invalid without a recurrence" do
            task = Task.new(recurrence: nil)
            task.valid?
            expect(task.errors[:recurrence]).to include('can\'t be blank')
        end
        it "is invalid if not 'daily' or 'weekly'" do
            newtask = Task.new(recurrence: "mensuelle")
            newtask.valid?
            expect(newtask.errors[:recurrence]).to include("is not included in the list")
        end
        it "is invalid without a auto_assigned" do
            task = Task.new(auto_assigned: nil)
            task.valid?
            expect(task.errors[:auto_assigned]).to include('is not a boolean')
        end
        it "is invalid without a default_difficulty" do
            task = Task.new(default_difficulty: nil)
            task.valid?
            expect(task.errors[:default_difficulty]).to include('can\'t be blank')
        end
    end
end
