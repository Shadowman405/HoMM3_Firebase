//
//  NewHeroAdd.swift
//  HoMM3_Firebase
//
//  Created by Maxim Mitin on 10.09.22.
//

import SwiftUI

struct NewHeroAdd: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var id = ""
    @State private var imageName = ""
    @State private var name = ""
    @State private var heroClass = ""
    @State private var heroSpec = ""
    @State private var heroFirstSkill = ""
    @State private var heroSecondSkill = ""
    @State private var heroDescription = ""
    
    var body: some View {
        VStack {
            TextField("ID", text: $id)
                .padding()
            TextField("Image Name", text: $imageName)
                .padding()
            TextField("Name", text: $name)
                .padding()
            TextField("Hero Class", text: $heroClass)    .padding()
            TextField("Hero Specialization", text: $heroSpec)
                .padding()
            TextField("Hero First Skill", text: $heroFirstSkill)
                .padding()
            TextField("Hero Second Skill", text: $heroSecondSkill)
                .padding()
            TextField("Hero Description", text: $heroDescription)
                .padding()

            
            Button {
                dataManager.addHero(id: Int(id) ?? 1, imageName: imageName, name: name, heroClass: heroClass, heroSpec: heroSpec, heroFirstSkill: heroFirstSkill, heroSecondSkill: heroSecondSkill, heroDescription: heroDescription)
            } label: {
                Text("Save")
            }

        }
        .padding()
    }
}

struct NewHeroAdd_Previews: PreviewProvider {
    static var previews: some View {
        NewHeroAdd()
            .environmentObject(DataManager())
    }
}
