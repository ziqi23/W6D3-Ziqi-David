class ApplicationController < ActionController::Base

    def index

        render plain: "I'm in the index action!"

    end


end
