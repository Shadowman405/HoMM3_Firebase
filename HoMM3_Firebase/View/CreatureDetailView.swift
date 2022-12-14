//
//  CreatureDetailView.swift
//  HoMM3_Firebase
//
//  Created by Maxim Mitin on 21.09.22.
//

import SwiftUI

struct CreatureDetailView: View {
    @EnvironmentObject var dataManager: DataManager
    
    var creature: Creature
    
    var body: some View {
        ZStack {
            AnimatedBackView()
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    HStack {
                        Spacer()
                        Image(creature.imageName)
                        //.resizable()
                            //.clipShape(Circle())
                            .frame(width: 120, height:120)
                            .shadow(color: .orange, radius: 9)
                            .padding()
                        Spacer()
                    }
                    HStack {
                        VStack(alignment: .leading) {
                            VStack(alignment: .center) {
                                Text("Hometown : " + creature.town)
                                    .font(.title2)
                                Text("Level : " + creature.level)
                                    .font(.title2)
                            }
                            .padding()
                            
                            VStack(alignment: .leading) {
                                Text("Creature stats")
                                    .font(.title2)
                                Text("Attack : " + creature.attack)
                                Text("Defense : " + (creature.defence))
                                Text("Damage : " + (creature.damage))
                                Text("Speed : " + (creature.speed))

                            }
                            .padding()
                        }
                        Spacer()
                    }

                    Spacer()
                }
                .navigationTitle(creature.name)
            }
        }
    }
}

struct CreatureDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CreatureDetailView(creature: Creature(id: 0, imageName: "Pikeman_portrait", name: "Pikeman", attack: "4", defence: "5", damage: "1-3", health: "10", speed: "4", level: "1", town: "Castle"))
            .environmentObject(DataManager())
    }
}
