class BlogPost < ApplicationRecord
  after_create do
    AddTitleJob.set(wait: 10.seconds).perform_later(self)
    ActionCable.server.broadcast "chat_channel", "new_post"
  end

  def self.update_title!
    BlogPost.all.each do |post|
      index = post.title.split("_").last.try(:to_i).try(:+, 1)
      post.update_column :title, "#{post.title.split("_").first}_#{index}"
    end
  end
end
