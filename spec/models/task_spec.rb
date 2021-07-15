require 'rails_helper'

# RECURRENCE = %w(Journalière Hebdomadaire)

describe Task, type: :model do
    context 'Associations' do
        it { should have_many(:coloc_tasks) }
    end
    context 'Validations' do
        it "is valid with a name, description, recurrence, auto_assigned, and default_difficulty" do
            task = Task.create(name: "Aspi", description: "Aspi is good for the health", recurrence: "Hebdomadaire", auto_assigned: true, default_difficulty: 3)
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
        # RECURRENCE.each do |valid_recurrence|
        #     it "is valid with '#{valid_recurrence}' recurrence" do
        #         expect(build(:task, recurrence: valid_status)).to be_valid
        #     end
        # end
        # it "is invalid without 'Journalière' or 'Hebdomadaire'" do
        #     expect(build(:task, recurrence: 'Mensuelle')).to_not be_valid
        # end
        it "is invalid without a auto_assigned" do
            task = Task.new(auto_assigned: nil)
            task.valid?
            expect(task.errors[:auto_assigned]).to include('can\'t be blank')
        end
        it "is invalid without a default_difficulty" do
            task = Task.new(default_difficulty: nil)
            task.valid?
            expect(task.errors[:default_difficulty]).to include('can\'t be blank')
        end
        # it "is invalid if default_difficulty is a string" do
        #     task = Task.new(default_difficulty: "two")
        #     task.valid?
        #     expect(task.errors[:default_difficulty]).to include('is not a number')
        # end
        # it "is invalid if default_difficulty is a float " do
        #     task = Task.new(default_difficulty: 2.2)
        #     task.valid?
        #     expect(task.errors[:default_difficulty]).to include('must be an integer')
        # end
    end
end
