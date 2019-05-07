class ApplicationController < ActionController::API

    def search
        if params[:query].present?
            cocktails = Cocktail.where("name LIKE ?", "%#{params[:query]}%")
            ingredients = Ingredient.where("name LIKE ?", "%#{params[:query]}%")
            if !params[:query].empty?
                flash[:message] = "Search results for '#{params[:query]}'."
            end
            if cocktails.size == 0 and ingredients.size == 0
                flash[:message] = "We didn't find any search results that matched '#{params[:query]}'."
            end
            search_results = []
            search_results << cocktails
            search_results << ingredients
            render json: search_results, status: :ok
        end
    end

end
