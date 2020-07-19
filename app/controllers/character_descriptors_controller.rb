class CharacterDescriptorsController < InheritedResources::Base

  private

    def character_descriptor_params
      params.require(:character_descriptor).permit()
    end

end
