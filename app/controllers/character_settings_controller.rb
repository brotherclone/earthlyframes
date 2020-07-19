class CharacterSettingsController < InheritedResources::Base

  private

    def character_setting_params
      params.require(:character_setting).permit()
    end

end
