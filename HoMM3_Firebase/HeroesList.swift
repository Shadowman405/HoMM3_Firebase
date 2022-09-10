//
//  HeroesList.swift
//  HoMM3_Firebase
//
//  Created by Maxim Mitin on 10.09.22.
//

import SwiftUI

struct HeroesList: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var showPopup = false
    
    var body: some View {
        NavigationView {
            List(dataManager.heroes, id: \.id) { hero in
                Image(hero.imageName)
                    .clipShape(Circle())
                Text(hero.name)
            }
            .navigationTitle("Heroes")
            .navigationBarItems(trailing: Button(action: {
                showPopup.toggle()
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showPopup) {
                NewHeroAdd()
            }
        }
    }
}

struct HeroesList_Previews: PreviewProvider {
    static var previews: some View {
        HeroesList()
            .environmentObject(DataManager())
    }
}
