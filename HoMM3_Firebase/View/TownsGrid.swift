//
//  TownsGrid.swift
//  HoMM3_Firebase
//
//  Created by Maxim Mitin on 12.09.22.
//

import SwiftUI

struct TownsGrid: View {
    @EnvironmentObject var dataManager: DataManager
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 10, alignment: nil)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(townGrid.towns){ town in
                    TownCell(town: town)
                }
            }
        }
        .padding()
        .navigationTitle("Towns")
    }
}

struct TownsGrid_Previews: PreviewProvider {
    static var previews: some View {
        TownsGrid()
            .environmentObject(DataManager())
    }
}
