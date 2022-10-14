//
//  Recipe.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/10/03.
//

import Foundation
import Firebase

struct recipes: Identifiable, Decodable {
    
    var id: Int
    var Author: String
    var Categories: [String]
    var CookingInstructions: [String]
    var Description: String
    var Favorite: Bool
    var Image: String
    var Ingredients: [String]
    var Name: String
    var Rating: Int
    var Vegan: Bool
    var TotalCookTime: String
}
