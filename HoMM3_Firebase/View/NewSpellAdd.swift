//
//  NewSpellAdd.swift
//  HoMM3_Firebase
//
//  Created by Maxim Mitin on 18.09.22.
//

import SwiftUI

struct NewSpellAdd: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var id = ""
    @State private var imageName = ""
    @State private var name = ""
    @State private var spellLevel = ""
    @State private var spellSchool = ""
    @State private var description = ""
    
    var body: some View {
        VStack {
            TextField("ID", text: $id)
                .padding()
            TextField("Image Name", text: $imageName)
                .padding()
            TextField("Name", text: $name)
                .padding()
            TextField("Spell Level", text: $spellLevel)    .padding()
            TextField("Spell School", text: $spellSchool)
                .padding()
            TextField("Spell Description", text: $description)
                .padding()

            
            Button {
                dataManager.addSpell(id: Int(id) ?? 0, imageName: imageName, name: name, spellLevel: Int(spellLevel) ?? 1, spellSchool: spellSchool, description: description)
            } label: {
                Text("Save")
            }

        }
        .padding()
    }
}

struct NewSpellAdd_Previews: PreviewProvider {
    static var previews: some View {
        NewSpellAdd()
            .environmentObject(DataManager())
    }
}
