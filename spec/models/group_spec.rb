require 'spec_helper'

describe Group do

  let( :user) { FactoryGirl.create(:user) }
  before {  @group = user.groups.build(name: "Lorem ipsum") }

  subject { @group }

  it { should respond_to(:name) }
  it { should respond_to(:user_id) }
  it { should respond_to(:starts_at) }
  it { should respond_to(:ends_at) }
  it { should respond_to(:agegroup) }
  it { should respond_to(:kindergarden) }
  it { should respond_to(:category) }
  it { should respond_to(:duration) }
  it { should respond_to(:intermittency) }

  it { should be_valid }



  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Group.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "when user_id is not present" do 
    before { @group.user_id = nil }
    it { should_not be_valid }
  end

  describe "when name is not present" do 
    before { @group.name = nil }
    it { should_not be_valid }
  end

  describe "with blank name" do
    before { @group.name = " "}
    it { should_not be_valid }
  end

  describe "with name is too long" do
    before { @group.name = "a" * 141}
    it { should_not be_valid }
  end
end
