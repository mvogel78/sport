# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  firstname  :string(255)
#  lastname   :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do

  before { @user = User.new( :lastname => "User", 
                             :firstname => "Example", 
                             :email => "example@user.com", 
                             :password => "foobar", 
                             :password_confirmation => "foobar" )}

  subject { @user }

  it { should respond_to(:lastname) }
  it { should respond_to(:firstname) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:admin) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:groups) }


  it { should be_valid }
  it { should_not be_admin }

  describe "with admin attribute set to 'true'" do
    before do
      @user.save!
      @user.toggle!(:admin)
    end

    it { should be_admin }
  end


  describe "when lastname is not present" do
    before { @user.lastname = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.lastname = " " }
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end


  describe "when password and password confirmation do not match" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when lastname is to long" do
    before { @user.lastname = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when firstname is to long" do
    before { @user.firstname = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end      
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end      
    end
  end

 describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when email address is already taken - case" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
    it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end
  
  describe "remember token" do 
    before { @user.save }
    its( :remember_token ) { should_not be_blank }
  end

  describe "group association" do
    before { @user.save }
    let!(:older_group) do
      FactoryGirl.create(:group, user: @user, starts_at: 1.week.from_now )
    end
    let!(:newer_group) do
      FactoryGirl.create(:group, user: @user, starts_at: 1.month.from_now )
    end

    it "should have the right groups in the right order" do
      @user.groups.should == [ newer_group, older_group ]
    end

    it "should destroy associated groups" do 
      groups = @user.groups
      @user.destroy
      groups.each do |group|
        Group.find_by_id(group.id).should be_nil
      end
    end
  end
end
