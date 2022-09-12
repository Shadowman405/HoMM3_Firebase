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
            List(dataManager.categories, id: \.id) { category in
                HStack {
                    Image(category.imageName)
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                    Text(category.name)
                }
            }
            .navigationTitle("Heroes 3 Wiki")
        }
    }
}

struct CategoriesList_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesList()
            .environmentObject(DataManager())
    }
}
