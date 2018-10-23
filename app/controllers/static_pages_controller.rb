class StaticPagesController < ApplicationController
    def home
        @logedUser =  current_user
    end
end
