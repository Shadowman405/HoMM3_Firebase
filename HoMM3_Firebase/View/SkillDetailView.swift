//
//  SkillDetailView.swift
//  HoMM3_Firebase
//
//  Created by Maxim Mitin on 27.09.22.
//

import SwiftUI

struct SkillDetailView: View {
    var skill: Skill
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    Image(skill.imageName)
                    .shadow(color: .orange, radius: 10)
                }
                .clipShape(Circle())
                
                Text("Basic: ")
                    .font(.title2)
                Text(skill.basic)
                    .padding()
                Text("Advanced: ")
                    .font(.title2)
                Text(skill.advanced)
                    .padding()
                Text("Expert:  ")
                    .font(.title2)
                Text(skill.expert)
                    .padding()
                
                Text("Description: ")
                    .font(.title2)
                Text(skill.description)
                    .padding()
            }
            .navigationTitle(skill.name)
        }
    }
}

struct SkillDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SkillDetailView(skill: Skill(id: 0, imageName: "", name: "", description: "", basic: "", advanced: "", expert: ""))
    }
}
