class EntriesController < InheritedResources::Base

  private

    def entry_params
      params.require(:entry).permit()
    end

end
