require 'time'

class Post
  attr_accessor :id,
                :title,
                :content

  def initialize(title, content)
    title != "" ? self.title = title : self.title = "Sample title (Unique number: #{Time.now.to_i})"
    content != "" ? self.content = content : self.content = "Sample content (Unique number: #{Time.now.to_i})"
  end
end