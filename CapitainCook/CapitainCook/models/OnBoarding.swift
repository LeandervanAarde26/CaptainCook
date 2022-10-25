//
//  Recipe.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/10/03.
//

import Foundation


struct onBoard: Identifiable, Decodable {
    
    var id = UUID()
    var Images: String
    var Colours: String
    var Titles: String
//    var helperScreens: [String]
}


