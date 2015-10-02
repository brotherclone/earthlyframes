class Release < ActiveRecord::Base
  belongs_to :album, :foreign_key =>'albums_id'
end
