//
//  Creature.swift
//  HoMM3_Firebase
//
//  Created by Maxim Mitin on 21.09.22.
//

import Foundation

struct Skill: Identifiable  {
    var id: Int
    var imageName: String
    var name: String
    var description: String
    var basic: String
    var advanced: String
    var expert: String
}
