ingredient_response = JSON.parse(RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"))

ingredients_names = []
for index in 0...ingredient_response['drinks'].size
    ingredients_names << ingredient_response['drinks'][index]['strIngredient1']
end

ingredients_info = []
i = 0
ingredients_names.each do |name|
    if i == 22 or i == 115
        ingredient_info = JSON.parse(RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/lookup.php?iid=#{i}"))
        ingredients_info << ingredient_info['ingredients'][0]
        i += 1
        next
    end
    ingredient_info = JSON.parse(RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?i=#{name}"))
    ingredients_info << ingredient_info['ingredients'][0]
    #save to db here
    i += 1
end

drink_ids = []
i = 0
ingredients_names.each do |name|
    if i == 22 or i == 115
        i += 1
        next
    end
    ingredients_drinks = JSON.parse(RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{name}"))
    ingredients_drinks['drinks'].each do |drink|
        drink_ids << drink['idDrink']
    end
    i += 1
end

drink_ids = drink_ids.uniq

cocktails = []
drinks.each do |id|
    drink_info = JSON.parse(RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{id}"))
    cocktails << drink_info['drinks'][0]
    # save drink info into db
end