//
//  ViewController.swift
//  The Flyweight Pattern
//
//  Created by Quinton Quaye on 7/19/19.
//  Copyright © 2019 Quinton Quaye. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var shoppingList = ShoppingList()
    //var mylist: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(items.count)
        addOutsideItemsToList(theseItems: items)
    }

    // lets add all items outside the manager to the list
    func addOutsideItemsToList(theseItems: [String]){
        for item in theseItems{
            shoppingList.addItemToList(item: item)
            shoppingList.addItemToList(item: item, amountOfItem: 2, nameOfAddigProduct: "The Q")
            
        }
        print(shoppingList.description)
    }
}

