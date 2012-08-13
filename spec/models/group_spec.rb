require 'spec_helper'

describe Group do
  let( :user) { FactoryGirl.create(:user) }
  before do
    @group = Group.new( name: "Gruppe 1", user_id: user_id) 
  end

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

  describe "when user_id is not present" do
    before { @group.user_id = nil }
    it { should_not be_valid }
  end
end
