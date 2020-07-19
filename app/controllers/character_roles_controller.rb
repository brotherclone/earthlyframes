class CharacterRolesController < InheritedResources::Base

  private

    def character_role_params
      params.require(:character_role).permit()
    end

end
