//
//  CategoriesList.swift
//  HoMM3_Firebase
//
//  Created by Maxim Mitin on 12.09.22.
//

import SwiftUI

struct CategoriesList: View {
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        NavigationView {
            VStack {
                VideoPlayerView()
                    .clipShape(Rectangle())
                    .cornerRadius(10)
                    .padding()
                
                List(dataManager.categories, id: \.id) { category in
                    HStack {
                        Image(category.imageName)
                            .clipShape(Circle())
                            .frame(width: 50, height: 50)
                        Text(category.name)
                        
                        if category.id == 0 {
                            NavigationLink {
                                TownsGrid(dataManager: _dataManager)
                            } label: {
                                Text("")
                            }
                        } else if category.id == 1 {
                            NavigationLink {
                                HeroesList(dataManager: _dataManager)
                            } label: {
                                Text("")
                            }
                        } else if category.id == 4 {
                            NavigationLink {
                                ArtifactsList(dataManager: _dataManager)
                            } label: {
                                Text("")
                            }
                        } else if category.id == 3 {
                            NavigationLink {
                                SpellsList(dataManager: _dataManager, spellsArray: dataManager.spells)
                            } label: {
                                Text("")
                            }
                        }
                    }
                }
                .navigationTitle("Heroes 3 Wiki")
            }
        }
    }
}

struct CategoriesList_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesList()
            .environmentObject(DataManager())
    }
}
