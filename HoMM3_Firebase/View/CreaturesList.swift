//
//  CreaturesList.swift
//  HoMM3_Firebase
//
//  Created by Maxim Mitin on 21.09.22.
//

import SwiftUI

struct CreaturesList: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var showPopup = false
    @State var selectedTown = 0
    let towns = ["Castle", "Rampart", "Tower", "Inferno", "Necropolis", "Dungeon", "Citadel", "Fortress", "Conflux"]
    
    var body: some View {
        Text("Select Creature Town")
            .font(.title3)
        Picker("Choose Magic School",selection: $selectedTown) {
            ForEach(0..<towns.count){ town in
                if town == 0 {
                    Text("Castle")
                } else if town == 1 {
                    Text("Rampart")
                } else if town == 2 {
                    Text("Tower")
                } else if town == 3 {
                    Text("Inferno")
                } else if town == 4 {
                    Text("Necropolis")
                } else if town == 5 {
                    Text("Dungeon")
                } else if town == 6 {
                    Text("Citadel")
                } else if town == 7 {
                    Text("Fortress")
                } else if town == 8 {
                    Text("Conflux")
                }
            }
        }
        
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
