class CharacterBackgroundsController < InheritedResources::Base

  private

    def character_background_params
      params.require(:character_background).permit()
    end

end
