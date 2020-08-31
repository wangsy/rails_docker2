class BlogPost < ApplicationRecord
  after_create do
    AddTitleJob.set(wait: 10.seconds).perform_later(self)
    ActionCable.server.broadcast "chat_channel", "new_post"
  end
end
