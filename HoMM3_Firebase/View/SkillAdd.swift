//
//  SkillAdd.swift
//  HoMM3_Firebase
//
//  Created by Maxim Mitin on 28.09.22.
//

import SwiftUI

struct SkillAdd: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var id = ""
    @State private var imageName = ""
    @State private var name = ""
    @State private var description = ""
    @State private var basic = ""
    @State private var advanced = ""
    @State private var expert = ""
    
    var body: some View {
        VStack {
            TextField("ID", text: $id)
                .padding()
            TextField("Image Name", text: $imageName)
                .padding()
            TextField("Name", text: $name)
                .padding()
            TextField("Description", text: $description)
                .padding()
            TextField("Basic Description", text: $basic)
                .padding()
            TextField("Advanced Description", text: $advanced)
                .padding()
            TextField("Expert Description", text: $expert)
                .padding()
            
            Button {
                dataManager.addSkill()
            } label: {
                Text("Save")
            }

        }
        .padding()
    }
}

struct SkillAdd_Previews: PreviewProvider {
    static var previews: some View {
        SkillAdd()
            .environmentObject(DataManager())
    }
}
