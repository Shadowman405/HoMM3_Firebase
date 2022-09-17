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
