class CharactersController < InheritedResources::Base

  private

    def character_params
      params.require(:character).permit()
    end

end
