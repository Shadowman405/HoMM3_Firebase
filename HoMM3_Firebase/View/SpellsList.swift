//
//  SpellsList.swift
//  HoMM3_Firebase
//
//  Created by Maxim Mitin on 17.09.22.
//

import SwiftUI

struct SpellsList: View {
    @EnvironmentObject var dataManager: DataManager
    @State var selectedSchool = "Water Magic"
    let schools = ["Earth Magic", "Water Magic", "Air Magic", "Fire Magic", "All Schools"]
    
    var body: some View {
        Text("Select Magic School")
            .font(.title3)
        Picker("Choose Magic School",selection: $selectedSchool) {
            ForEach(0..<schools.count){ school in
                if school == 0 {
                    Text("Earth magic")
                } else if school == 2 {
                    Text("Air Magic")
                } else if school == 1 {
                    Text("Water Magic")
                } else if school == 3 {
                    Text("Fire Magic")
                } else {
                    Text("All Schools")
                }
            }
        }
        
        List(dataManager.spells, id: \.id) { spell in
            
            ZStack(alignment: .leading) {
                HStack {
                    ZStack {
                        Circle().foregroundColor(.indigo)

                        
                        Image(spell.imageName)
                            .clipShape(Circle().stroke(lineWidth: 80))
                        .shadow(color: .orange, radius: 10)
                    }
                    .frame(width: 50, height: 50)
                    
                    Text(spell.name)
                        .font(.title2)
                }
            }
        }
    }
}

struct SpellsList_Previews: PreviewProvider {
    static var previews: some View {
        SpellsList()
            .environmentObject(DataManager())
    }
}
