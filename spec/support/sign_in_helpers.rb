module SignInHelpers
  def sign_in_as_admin
    admin = FactoryGirl.create(:admin)
    sign_in_as admin
  end

  def sign_in
    user = FactoryGirl.create(:user)
    sign_in_as user
  end

  def sign_in_as user
    visit new_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password_digest
    click_button 'Sign in'
  end
end

RSpec.configure do |config|
  config.include SignInHelpers
end
