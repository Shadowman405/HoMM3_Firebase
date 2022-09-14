//
//  ArtifactDetailsView.swift
//  HoMM3_Firebase
//
//  Created by Maxim Mitin on 14.09.22.
//

import SwiftUI

struct ArtifactDetailsView: View {
    @EnvironmentObject var dataManager: DataManager
    var artifact : Artifact
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(artifact.imageName)
                    Text(artifact.name)
                        .font(.title)
                }
                HStack{
                    VStack(alignment: .leading) {
                        Text("Slot: " + artifact.slot)
                            .font(.title2)
                        Text("Effect: " + artifact.effect)
                            .font(.title2)
                    }
                }
                .padding()
                Text("Artifact Info:")
                    .font(.title)
                HStack{
                    Text(artifact.description)
                        .font(.title2)
                }
            }
            .navigationTitle("About Artifact")
        }
    }
}

struct ArtifactDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let art = Artifact(id: 0, name: "Cape Of Conjuring", imageName: "Artifact_Cape_of_Conjuring", slot: "Shoulders", effect: "Worn about the shoulders, this item increases the duration of all your spells by 3.", description: "Before you appears a levitating glass case with a folded cloak perched upon a bed of crimson velvet. At your touch, the lid opens and the cloak floats into your awaiting hands.")
        
        ArtifactDetailsView(artifact: art)
            .environmentObject(DataManager())
    }
}
