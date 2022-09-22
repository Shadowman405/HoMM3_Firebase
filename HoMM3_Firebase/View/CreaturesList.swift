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
                        Image(creature.imageName)
                            .shadow(color: .orange, radius: 7)
                    }
                    .padding()
                    
                    Text(creature.name)
                        .font(.title3)
                }
            
            NavigationLink {
                CreatureDetailView(creature: creature)
            } label: {
                Text("")
                }
            }
        }
        .navigationTitle("Creatures")
        .searchable(text: $searchText)
        .navigationBarItems(trailing: Button(action: {
            showPopup.toggle()
        }, label: {
            Image(systemName: "plus")
        }))
        .sheet(isPresented: $showPopup) {
            NewCreatureAdd()
        }
    }
}

struct CreaturesList_Previews: PreviewProvider {
    static var previews: some View {
        CreaturesList()
            .environmentObject(DataManager())
    }
}
