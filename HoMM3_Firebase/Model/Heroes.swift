//
//  Heroes.swift
//  HoMM3_Firebase
//
//  Created by Maxim Mitin on 10.09.22.
//

import SwiftUI

struct Hero: Identifiable {
    var id: Int
    var imageName: String
    var name: String
    var heroClass: String
    var heroSpec: String
    var heroFirstSkill: String
    var heroSecondSkill: String?
    var heroDescription: String
}
