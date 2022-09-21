//
//  CreaturesList.swift
//  HoMM3_Firebase
//
//  Created by Maxim Mitin on 21.09.22.
//

import SwiftUI

struct CreaturesList: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var searchText = ""
    @State private var showPopup = false
    //var tintColor: UIColor = .brown
    
    var body: some View {
        List(dataManager.creatures, id: \.id) { creature in
            
            ZStack(alignment: .leading) {
                HStack {
                    ZStack {
                        Circle().foregroundColor(.indigo)

                        
                        Image(creature.imgName)
                            .clipShape(Circle())
                            .shadow(color: .orange, radius: 7)                        
                    }
                    .frame(width: 50, height: 50)
                    .padding()
                    
                    Text(creature.name)
                        .font(.title2)
                }
            
//            NavigationLink {
//                ArtifactDetailsView(artifact: artifact)
//            } label: {
//                Text("")
//                }
            }
        }
        .navigationTitle("Creatures")
        .searchable(text: $searchText)
    }
}

struct CreaturesList_Previews: PreviewProvider {
    static var previews: some View {
        CreaturesList()
            .environmentObject(DataManager())
    }
}
