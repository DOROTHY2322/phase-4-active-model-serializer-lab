class AuthorSerializer < ActiveModel::Serializer
  attributes :name
  has_one :profile
  has_many :posts, serializer: AuthorPostSerializer

  # def profile
  #   ProfileSerializer.new(object.profile).attributes
  # end

  # def posts
  #   object.posts.map { |post| PostSerializer.new(post).attributes }
  # end``
end