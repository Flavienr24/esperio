class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @users = User.all
  end

  def test_page
  end

  def skills_index
    @skills = ActsAsTaggableOn::Tag.all
  end
end
