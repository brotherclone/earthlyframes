class Character < ActiveRecord::Base
  belongs_to :character_background
  belongs_to :character_setting
  belongs_to :character_descriptor
  belongs_to :character_role
  belongs_to :user
  belongs_to :log
  has_many :entries
  validates :name, presence: true


  def as_json(options={})
    super(:only => [:id,
                    :name,
                    :user_id,
                    :additional_bio,
                    :character_setting_id,
                    :character_background_id,
                    :character_role_id,
                    :character_descriptor_id,
                    :current_health,
                    :max_health,
                    :log_id,
                    :archived
    ])
  end

end
