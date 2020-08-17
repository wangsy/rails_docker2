class AddTitleJob < ApplicationJob
  queue_as :default

  def perform(*blog_posts)
    # Do something later
    blog_posts.each do |blog_post|
      blog_post.title = blog_post.title + "_1"
      blog_post.save!
    end
  end
end
