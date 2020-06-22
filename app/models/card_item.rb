class CardItem
  def all
    ObjectSpace.each_object(self).entries
  end

  @@array = Array.new
  attr_accessor :link, :img, :sub_title, :title, :description, :category, :category_link, :category_icon_name

  def self.all_instances
    @@array
  end

  def initialize(link, img, sub_title, title, description, category, category_link, category_icon_name)
    @link = link
    @img = img
    @sub_title = sub_title
    @title = title
    @description = description
    @category = category
    @category_link = category_link
    @category_icon_name = category_icon_name
    @@array << self
  end

end


