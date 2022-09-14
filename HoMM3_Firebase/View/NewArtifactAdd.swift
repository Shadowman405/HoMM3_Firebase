//
//  NewArtifactAdd.swift
//  HoMM3_Firebase
//
//  Created by Maxim Mitin on 14.09.22.
//

import SwiftUI

struct NewArtifactAdd: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var id = ""
    @State private var imageName = ""
    @State private var name = ""
    @State private var slot = ""
    @State private var effect = ""
    @State private var description = ""
    
    var body: some View {
        VStack {
            TextField("ID", text: $id)
                .padding()
            TextField("Image Name", text: $imageName)
                .padding()
            TextField("Name", text: $name)
                .padding()
            TextField("Slot", text: $slot)    .padding()
            TextField("Effect", text: $effect)
                .padding()
            TextField("Description", text: $description)
                .padding()
            
            Button {
                dataManager.addArtifact(id: Int(id) ?? 0, imageName: imageName, name: name, slot: slot, effect: effect, description: description)
            } label: {
                Text("Save")
            }

        }
        .padding()
    }
}

struct NewArtifactAdd_Previews: PreviewProvider {
    static var previews: some View {
        NewArtifactAdd()
            .environmentObject(DataManager())
    }
}
