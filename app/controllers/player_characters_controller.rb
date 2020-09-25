class PlayerCharactersController < InheritedResources::Base

  def index
    @no_ef_header = true
    @no_ef_footer = true

    @all_character_data = [
        :character_backgrounds => CharacterBackground.all,
        :character_descriptors => CharacterDescriptor.all,
        :character_roles => CharacterRole.all,
        :character_settings => CharacterSetting.all
    ]

    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @all_character_data}
    end

  end

end
