class BlogPost < ApplicationRecord
  after_create do
    AddTitleJob.set(wait: 10.seconds).perform_later(self)
  end
end
