class PagesController < ApplicationController
  def home
  @title = "Home"
  end

  def about_us
  @title = "About"
  end

  def contact_us
  @title = "Contact"
  end

  def privacy_policy
  @title = "Privacy Policy"
  end
end
