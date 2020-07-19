class PromptsController < InheritedResources::Base

  private

    def prompt_params
      params.require(:prompt).permit()
    end

end
