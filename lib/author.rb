require "pry"
class Author 
    attr_accessor :name, :posts, :title
    
    @@post_count = 0

    def initialize(name)
        @name = name
        @posts = []
    end
    
    def posts
        Post.all.select do |post|
            post.author == self
        end
    end

    def add_post(post)
        @posts << post
        post.author = self
    end

    def add_post_by_title(title)
        post = Post.new(title)
        @posts << post
        post.author = self
    end
    
    def self.post_count
        Post.all.select do |post|
            post.author == self
            @@post_count += 1
        end
        @@post_count
    end
end
