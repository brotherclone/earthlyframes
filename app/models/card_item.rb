class CardItem
  def all
    ObjectSpace.each_object(self).entries
  end

  @@array = Array.new
  attr_accessor :title, :img, :description, :link

  def self.all_instances
    @@array
  end

  def initialize(title,description, img, link)
    @title = title
    @img = img
    @description = description
    @link = link
    @@array << self
  end

end
