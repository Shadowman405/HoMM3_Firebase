//
//  SpellsList.swift
//  HoMM3_Firebase
//
//  Created by Maxim Mitin on 17.09.22.
//

import SwiftUI

struct SpellsList: View {
    @EnvironmentObject var dataManager: DataManager
    @State var selectedSchool = 0
    let schools = ["Earth Magic", "Water Magic", "Air Magic", "Fire Magic", "All Schools"]
    var spellsArray: [Spell] = []
    var filterSpellsArray: [Spell] = []
    
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
        
        List {
            ForEach(searchResults) { spell in
                ZStack {
                    HStack {
                        Image(spell.imageName)
                            .frame(width: 60, height:50)
                        Text(spell.name)
                        Spacer()
                        Text("   Spell Level :\(spell.spellLevel)")
                            .offset(x: -20)
                        
                    }
                    NavigationLink {
                        SpellDetailView()
                    } label: {
                        Text("")
                    }
                }
            }
        }
        .navigationTitle("Spells")
        .onAppear{
            print(spellsArray)
        }
    }
    
    var searchResults: [Spell] {
        if selectedSchool == 3 {
            return spellsArray.filter{
                $0.spellSchool == "Fire Magic"
            }
        } else if selectedSchool == 1 {
            return spellsArray.filter {
                $0.spellSchool == "Water Magic"
            }
        } else if selectedSchool == 2{
            return spellsArray.filter {
                $0.spellSchool == "Air Magic"
            }
        } else if selectedSchool == 0 {
            return spellsArray.filter {
                $0.spellSchool == "Earth Magic"
            }
        } else if selectedSchool == 4 {
            return spellsArray.filter{
                $0.spellSchool == "All Schools"
            }

//            return mainCat.spells.filter {
//                $0.spellSchool == .AllSchools
//            }
        } else {
            return spellsArray
        }
    }
}

struct SpellsList_Previews: PreviewProvider {
    static var previews: some View {
        SpellsList()
            .environmentObject(DataManager())
    }
}
