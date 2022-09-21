//
//  NewCreatureAdd.swift
//  HoMM3_Firebase
//
//  Created by Maxim Mitin on 21.09.22.
//

import SwiftUI

struct NewCreatureAdd: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var id = ""
    @State private var imageName = ""
    @State private var name = ""
    @State private var creatureAttack = ""
    @State private var creatureDef = ""
    @State private var creatureDmg = ""
    @State private var creatureHealth = ""
    @State private var creatureLvl = ""
    @State private var creatureSpeed = ""
    @State private var creatureTown = ""

    
    var body: some View {
        ScrollView {
            VStack {
                Group {
                    TextField("ID", text: $id)
                    TextField("Image Name", text: $imageName)
                    TextField("Name", text: $name)
                }

                Group {
                    TextField("Attack", text: $creatureAttack)
                    TextField("Defense", text: $creatureDef)
                    TextField("Damage", text: $creatureDmg)
                    TextField("Health", text: $creatureHealth)
                }
                Group {
                    TextField("Speed", text: $creatureSpeed)
                    TextField("Level", text: $creatureLvl)
                    TextField("HomeTown", text: $creatureTown)
                }
                
                Button {
                    dataManager.addCreature(id: Int(id) ?? 0, imageName: imageName, name: name, attack: creatureAttack, defense: creatureDef, damage: creatureDmg, health: creatureHealth, speed: creatureSpeed, level: creatureLvl, town: creatureTown)
                } label: {
                    Text("Save")
                }

            }
            .padding()
        }
    }
}


struct NewCreatureAdd_Previews: PreviewProvider {
    static var previews: some View {
        NewCreatureAdd()
            .environmentObject(DataManager())
    }
}
