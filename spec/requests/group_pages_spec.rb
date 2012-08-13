require 'spec_helper'

describe "Micropost pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "group creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a group" do
        expect { click_button "Save" }.should_not change(Group, :count)
      end

      describe "error messages" do
        before { click_button "Save" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before { fill_in 'group_name', with: "Lorem ipsum" }
      it "should create a group" do
        expect { click_button "Save" }.should change(Group, :count).by(1)
      end
    end
  end
end
