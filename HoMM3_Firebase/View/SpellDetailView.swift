//
//  SpellDetailView.swift
//  HoMM3_Firebase
//
//  Created by Maxim Mitin on 17.09.22.
//

import SwiftUI

struct SpellDetailView: View {
    @EnvironmentObject var dataManager: DataManager
    var spell: Spell
    
    var body: some View {
        ZStack {
            AnimatedBackView()
            
            ScrollView {
                VStack {
                                        
                    HStack {
                        Image(spell.imageName)
                            .frame(width: 100 , height: 100)
                        Spacer()
                    }
                    .padding()
                    
                    
                    HStack{
                        VStack(alignment: .leading) {
                            Text("Spell level: \(spell.spellLevel)")
                                .padding()
                            HStack{
                            if spell.spellSchool == "Water Magic" {
                                Text("Spell School: Water Magic").padding()
                                Image("School_of_Water_Magic")
                            } else if spell.spellSchool == "Fire Magic" {
                                Text("Spell School").padding()
                                Image("School_of_Fire_Magic")
                            } else if spell.spellSchool == "Air Magic" {
                                Text("Spell School: Air Magic").padding()
                                Image("School_of_Air_Magic")
                            } else {
                                Text("Spell School: Earth Magic").padding()
                                Image("School_of_Earth_Magic")
                                }
                                
                                
                            }
                            
                            Text(spell.description)
                                .padding()
                        }
                    }
                }
                .navigationTitle(spell.name)
            }
        }

    }
}

struct SpellDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SpellDetailView(spell: Spell(id: 0, name: "Cure", imageName: "Cure_small", description: "Cure", spellLevel: 1, spellSchool: "Water Magic"))
            .environmentObject(DataManager())
    }
}
