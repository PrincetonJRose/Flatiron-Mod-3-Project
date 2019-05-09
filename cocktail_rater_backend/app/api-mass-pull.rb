ingredient_response = JSON.parse(RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"))

ingredients_names = []
for index in 0...ingredient_response['drinks'].size
    ingredients_names << ingredient_response['drinks'][index]['strIngredient1']
end

ingredients_info = []
for i in 0...ingredients_names.size
    if i == 100
        next
    end
    if i == 22 or i == 115
        if i == 22
            id = 37
        else
            id = 278
        end
        ingredient_info = JSON.parse(RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/lookup.php?iid=#{id}"))
        ingredients_info << ingredient_info['ingredients'][0]
    else
        ingredient_info = JSON.parse(RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?i=#{ingredients_names[i]}"))
        ingredients_info << ingredient_info['ingredients'][0]
    end
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
drink_exclude = [17060, 17020, 13395, 14688, 12762, 15254, 17832, 11119]
cocktails = []
for i in 0...drink_ids.size
    if drink_exclude.include?(drink_ids[i].to_i)
        next
    end
    drink_info = JSON.parse(RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{drink_ids[i]}"))
    cocktails << drink_info['drinks'][0]
end

#save to db here
ingredients_info.each do |i|
    new_ing = Ingredient.new(name: i['strIngredient'], ingredient_api_id: i['idIngredient'], category: i['strType'], description: i['strDescription'])
    new_ing.save!
end

# save drink info into db
cocktails.each do |c|
    new_drink = Drink.new(drink_api_id: c['idDrink'], name: c['strDrink'], category: c['strCategory'], alcoholic: c['strAlcoholic'], glass: c['strGlass'], imageURL: c['strDrinkThumb'], instructions: c['strInstructions'], videoURL: c['strVideo'])
    if new_drink.save!
        for n in 1..15
            if c["strIngredient#{n}"] == "" or c["strIngredient#{n}"] == nil
                break
            end
            Ingredient.all.each do |i|
                if i.name.upcase == c["strIngredient#{n}"].upcase
                    DrinkIngredient.create(drink_id: new_drink.id, ingredient_id: i.id, measurement: c["strMeasure#{n}"])
                end
            end
        end
    else
        puts c['strDrink']
        break
    end
end
