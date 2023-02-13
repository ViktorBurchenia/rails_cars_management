class HomeController < ApplicationController
    def homepage
        render 'welcome/index'
    end 
    
    def help
         render 'welcome/index'
    end  
end 