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
                    
                    Text(skill.name)
                        .font(.title2)
                }
                
                NavigationLink() {
                    SkillDetailView()
                } label: {
                    Text("")
                    }
                }
            }
        }
}

struct SkillsList_Previews: PreviewProvider {
    static var previews: some View {
        SkillsList()
            .environmentObject(DataManager())
    }
}
