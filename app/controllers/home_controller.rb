class HomeController < ApplicationController
    def homepage
        render 'welcome/index'
    end 
    
    def help
         render 'help/help_page'
    end  
end 