//
//  TheFlyweight.swift
//  The Flyweight Pattern
//
//  Created by Quinton Quaye on 7/19/19.
//  Copyright © 2019 Quinton Quaye. All rights reserved.
//

import Foundation

//You want to use the flyweight pattern when:
//#1 You create many instances of the same object
//#2 You can afford to use memory to cache instances
//#3 You do not mutate those instances, and can afford to share them accross your program

//A shopping list using the flyyweight pattern

//#1 Identify the object that will be reused over and over in our flyweight  pattern: The ingredient

struct Ingredient: CustomStringConvertible{
    let name: String
    var description: String{
        return name
    }
}


// the object that will manage the creation of those Ingredients - As we are leveraging the flyweight pattern, we want to reduce the number of instances of the Ingredient.

struct IngredientManager {
    //the known ingredients will act as our object cache
    private var knownIngredients = [String: Ingredient]()
    
    mutating func getIngredient(withName name: String)-> Ingredient{
        // check to see if we already have the ingredient in our list
        
        guard let ingredient = knownIngredients[name] else{
            //create an ingredient and register it as an instance
            knownIngredients[name] = Ingredient(name: name)
            //the attemp to get again
            return getIngredient(withName: name)
        }
        return ingredient
    }
    var count: Int{
        return knownIngredients.count
    }
}

// the ingredience manager will act as our central store, it will contain all the instances of Ingredients, we'll possibly ever need, and we'll be able to use it in our ShoppingList:

