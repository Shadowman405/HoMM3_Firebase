//
//  HeroDetailView.swift
//  HoMM3_Firebase
//
//  Created by Maxim Mitin on 10.09.22.
//

import SwiftUI

struct HeroDetailView: View {
    @EnvironmentObject var dataManager: DataManager
    
    var hero: Hero
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Spacer()
                    Image(hero.imageName)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding()
                    Spacer()
                }
                HStack {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("Hero class: ")
                                .font(.title2)
                            Text(" - " + hero.heroClass)
                            Text("Hero speciality: ")
                                .font(.title2)
                            Text(" - " + hero.heroSpec)
                        }
                        .padding()
                        
                        VStack(alignment: .leading) {
                            Text("Hero skills: ")
                                .font(.title2)
                            Text(" - " + hero.heroFirstSkill)
                            Text(" - " + (hero.heroSecondSkill ?? ""))

                        }
                        .padding()
                        VStack{
                            Text("Information about \(hero.name): ")
                                .font(.title2)
                            Text(hero.heroDescription)
                                .font(.callout)
                                .offset(x:5)
                        }
                    }
                    Spacer()
                }

                Spacer()
            }
            .navigationTitle(hero.name)
        }

    }
}

struct HeroDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        let hero =  Hero(id: 0, imageName: "Hero_Christian", name: "Christian", heroClass: "Knight", heroSpec: "Ballista", heroFirstSkill: "Basic Leadership", heroSecondSkill: "basic Artillery", heroDescription: "Christian was always more of a frontiersman than a Knight, having set foot in nearly every part of Enroth before finally settling into military service in Erathia. Though a wanderer and a bit of a dreamer, his battlefield tactics are feared throughout the world.")
        
        HeroDetailView(hero: hero)
            .environmentObject(DataManager())
    }
}
