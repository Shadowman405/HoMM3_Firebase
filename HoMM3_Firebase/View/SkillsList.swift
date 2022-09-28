//
//  SkillsList.swift
//  HoMM3_Firebase
//
//  Created by Maxim Mitin on 27.09.22.
//

import SwiftUI

struct SkillsList: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var searchText = ""
    @State private var showPopup = false
    
    var body: some View {
        List(dataManager.skills, id: \.id) { skill in
            ZStack(alignment: .leading) {
                HStack() {
                    Image(skill.imageName)
                        .clipShape(Circle())
                        .shadow(color: .orange, radius: 7)
                    
                    Text(skill.name)
                        .font(.title2)
                }
                
                NavigationLink() {
                    SkillDetailView(skill: skill)
                } label: {
                    Text("")
                    }
                }
            }
            .navigationTitle("Secondary Skills")
            .searchable(text: $searchText)
            .navigationBarItems(trailing: Button(action:    {
                showPopup.toggle()
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showPopup) {
                NewArtifactAdd()
        }
        }
}

struct SkillsList_Previews: PreviewProvider {
    static var previews: some View {
        SkillsList()
            .environmentObject(DataManager())
    }
}
