//
//  Filter.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/10/31.
//

import Foundation

struct Filter: Identifiable, Decodable {
    
    var id = UUID()
    var Emoji: String
    var FilterName: String
    var Selected : Bool

}
