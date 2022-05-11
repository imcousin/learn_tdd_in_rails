require 'rails_helper'

RSpec.describe "CreatingBlogPosts", type: :system do
  before do
    driven_by(:rack_test)
  end


  ## Steps:
  # 1. create the test first
  # 2. step by step write only enough production code to fix the current error or test failure
  # 3. Add guard gem, guard-rspec or other guard specifics gems
  # 4. bundle exec guard init rspec
  # 5. Add gem 'rspec-rails'
  # 6. run guard 'bundle exec guard'
  
  # The code describes the steps a user would take interacting with our app:
  #   Visiting the new blog post page
  #   Entering a title and body into form fields
  #   Clicking a "Create Blog Post" button
  #   Confirming that the blog post appears on the screen
  #   Confirm that the blog post is saved into the database
  it 'saves and displays the resulting blog post' do
    visit '/blog_posts/new'
    fill_in 'Title', with: 'Hello, World!'
    fill_in 'Body', with: 'Hello, I say!'
    click_on 'Create Blog Post'
    expect(page).to have_content('Hello, World!')
    expect(page).to have_content('Hello, I say!')
    blog_post = BlogPost.order("id").last
    expect(blog_post.title).to eq('Hello, World!')
    expect(blog_post.body).to eq('Hello, I say!')
  end
end
