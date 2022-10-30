//
//  Settings.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/10/30.
//

import Foundation

struct settingModel: Identifiable, Decodable{
    var id = UUID()
    var Image: String
    var Texts: String
}
