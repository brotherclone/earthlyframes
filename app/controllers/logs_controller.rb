class LogsController < InheritedResources::Base

  private

    def log_params
      params.require(:log).permit()
    end

end
