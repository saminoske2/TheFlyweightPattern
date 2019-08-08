//
//  ShoppingList.swift
//  The Flyweight Pattern
//
//  Created by Quinton Quaye on 7/19/19.
//  Copyright © 2019 Quinton Quaye. All rights reserved.
//

import Foundation

//The Shopping List

struct ShoppingList: CustomStringConvertible{
    // the list is going to contain the shoppingItem and how many of that item
    private var list = [(Ingredient, Int, String?)]()
    private var manager = IngredientManager()
    
    mutating func addItemToList(item: String, amountOfItem: Int = 1, nameOfAddigProduct: String? = "manager"){
        //let the manager create and utilize the ingredient getIngredient() ->Ingredient
        let ingredient = manager.getIngredient(withName: item)
        // the list will consist of the Ingredient
        list.append((ingredient, amountOfItem, nameOfAddigProduct))
    }
    
    var description: String{
        return "\(manager.count) Items: \n\n" + list.map { (ingredient, value, name) in
            return "\(ingredient) x \(value), name: \(String(describing: name))"
            }.joined(separator: "\n")
    }
}


// now we can use this shopping list - Items without the manager
let items = ["Kale", "Bananas", "Peaches", "Grapes", "Turnips", "Carrots", "Rice", "Milk"]

