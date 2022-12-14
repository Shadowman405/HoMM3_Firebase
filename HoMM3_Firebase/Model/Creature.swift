//
//  Creature.swift
//  HoMM3_Firebase
//
//  Created by Maxim Mitin on 21.09.22.
//

import Foundation

struct Creature: Identifiable  {
    var id: Int
    var imageName: String
    var name: String
    var attack: String
    var defence: String
    var damage: String
    var health: String
    var speed: String
    var level: String
    var town: String
}
