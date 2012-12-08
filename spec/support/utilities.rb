def sign_in(fan)
  visit signin_path
  fill_in "Email",    with: fan.email
  fill_in "Password", with: fan.password
  click_button "Sign in"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = fan.remember_token
end