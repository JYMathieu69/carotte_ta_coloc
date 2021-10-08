require 'rails_helper'
describe Coloc, type: :model do
  context 'Associations' do
    it { should have_many(:users) }
    it { should have_many(:coloc_tasks) }
    it { should have_many(:ongoing_tasks) }
  end

  after(:each) do
    I18n.locale = :en
  end

  context 'Validations' do
    it "is valid with a name and a leader" do
      leader = create(:leader)
      coloc69004 = Coloc.new(name: "Coloc69004", leader: leader)
      expect(coloc69004).to be_valid
    end

    it 'is invalid without a name' do
      leader = create(:leader)
      coloc69004 = Coloc.new(name: nil)
      coloc69004.valid?
      expect(coloc69004.errors[:name]).to include('can\'t be blank')
    end

    it 'is invalid with a name with special characters' do
      coloc69004 = Coloc.new(name: "+*coloc69004")
      coloc69004.valid?
      expect(coloc69004.errors[:name]).to include('only letters and digits')
    end

    it 'is invalid with a too short name' do
      coloc69004 = Coloc.new(name: "a")
      coloc69004.valid?
      expect(coloc69004.errors[:name]).to include('is too short (minimum is 2 characters)')
    end

    it 'is invalid with a too long name' do
      coloc69004 = Coloc.new(name: "Unsuperlongdecolocmaisvraimenttrèstrèstrèslong")
      coloc69004.valid?
      expect(coloc69004.errors[:name]).to include('is too long (maximum is 20 characters)')
    end

    it 'is valid with a space' do
      leader = create(:leader)
      coloc69004 = Coloc.new(name: "A space", leader: leader)
      expect(coloc69004).to be_valid
    end 

    it 'is invalid without a leader' do
      leader = create(:leader)
      coloc69004 = Coloc.new(leader: nil)
      coloc69004.valid?
      expect(coloc69004.errors[:leader]).to include('must exist')
    end

    it 'is invalid if name is duplicated' do
      coloc1 = create(:coloc, name: "SuperColoc")
      coloc_duplicated = build(:coloc, name: "SuperColoc")
      coloc_duplicated.valid?
      expect(coloc_duplicated.errors[:name]).to include('has already been taken')
    end

    it 'is invalid if leader is duplicated' do
      leader = create(:leader)
      coloc1 = create(:coloc, leader: leader)
      coloc_duplicated = build(:coloc, leader: leader)
      coloc_duplicated.valid?
      expect(coloc_duplicated.errors[:leader]).to include('has already been taken')
    end
  end

  context 'methods' do 
    it 'is suppose to respond to invite_token' do 
      coloc = create(:coloc)
      expect(coloc.invite_token).to match(/#{coloc.id}-\w{8}/)
    end
  end
end
