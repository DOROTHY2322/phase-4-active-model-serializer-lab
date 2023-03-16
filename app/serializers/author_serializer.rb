class AuthorSerializer < ActiveModel::Serializer
  attributes :name, :profile, :posts

  def profile
    {
      username: object.profile.username,
      email: object.profile.email,
      bio: object.profile.bio,
      avatar_url: object.profile.avatar_url
    }
  end

  def posts
    object.posts.map do |post|
      {
        title: post.title,
        short_content: post.content.truncate(40, omission: '...'),
        tags: post.tags.pluck(:name)
      }
    end
    def short_content
      content[0..39] + (content.length > 40 ? "..." : "")
    end
    
  end
end
