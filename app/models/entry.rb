class Entry  < ActiveRecord::Base

  belongs_to :character
  belongs_to :prompt
  accepts_nested_attributes_for :character
  accepts_nested_attributes_for :prompt

  def as_json(options={})
    super(:only => [:id, :entry_text, :character_id, :prompt_id], :include=> {:character =>{:only=>[:name, :log_id]}})
  end


end
