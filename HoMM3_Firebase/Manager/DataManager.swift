//
//  DataManager.swift
//  HoMM3_Firebase
//
//  Created by Maxim Mitin on 10.09.22.
//

import SwiftUI
import Firebase

class DataManager: ObservableObject {
    @Published var heroes: [Hero] = []
    
    init(){
        fetchDogs()
    }
    
    func fetchDogs() {
        heroes.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Heroes")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? Int ?? 0
                    let imageName = data["imageName"] as? String ?? ""
                    let name = data["name"] as? String ?? ""
                    let heroClass = data["heroClass"] as? String ?? ""
                    let heroSpec = data["heroSpec"] as? String ?? ""
                    let firstSkill = data["firstSkill"] as? String ?? ""
                    let secondSkill = data["secondSkill"] as? String ?? ""
                    let heroDescr = data["heroDescr"] as? String ?? ""
                    
                    let hero = Hero(id: id, imageName: imageName, name: name, heroClass: heroClass, heroSpec: heroSpec, heroFirstSkill: firstSkill, heroSecondSkill: secondSkill, heroDescription: heroDescr)
                    self.heroes.append(hero)
                }
            }
        }
    }
    
    func addDog(dogBreed: String) {
        let db = Firestore.firestore()
        let ref = db.collection("Heroes").document(dogBreed)
        ref.setData(["breed": dogBreed, "id": Int.random(in: 6..<10000)]) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}

