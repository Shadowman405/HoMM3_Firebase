//
//  Spell.swift
//  HoMM3_Firebase
//
//  Created by Maxim Mitin on 17.09.22.
//

import SwiftUI

struct Spell: Identifiable {
    var id: Int
    var name: String
    var imageName: String
    var description: String
    var spellLevel: Int
    var spellSchool: String
}
