class PostSerializer < ActiveModel::Serializer
  attributes :title, :content, :author_name, :tags

  def author_name
    object.author.name
  end

  def tags
    object.tags.map { |tag| { name: tag.name } }
  end

  def short_content
    content[0..39] + (content.length > 40 ? "..." : "")
  end
end
