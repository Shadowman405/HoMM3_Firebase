//
//  ArtifactsList.swift
//  HoMM3_Firebase
//
//  Created by Maxim Mitin on 14.09.22.
//

import SwiftUI

struct ArtifactsList: View {
    @EnvironmentObject var dataManager: DataManager

    
    var body: some View {
        List(dataManager.artifacts, id: \.id) { artifact in
            
            ZStack {
                Circle().foregroundColor(.indigo)

                
                Image(artifact.imageName)
                    .clipShape(Circle().stroke(lineWidth: 80))
                .shadow(color: .orange, radius: 10)
            }
            .frame(width: 50, height: 50)
            
            Text(artifact.name)
                .font(.title2)
        }
    }
}

struct ArtifactsList_Previews: PreviewProvider {
    static var previews: some View {
        ArtifactsList()
            .environmentObject(DataManager())
    }
}
