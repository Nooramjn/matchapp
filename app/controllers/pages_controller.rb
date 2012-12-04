class PagesController < ApplicationController
  def home
  @title = "Home"
  end

  def about
  @title = "About"
  end

  def contact
  @title = "Contact"
  end

  def privacy_policy
  @title = "Privacy Policy"
  end
end
