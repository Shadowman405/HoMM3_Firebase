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
    @Published var categories: [Category] = []
    @Published var towns: [Town] = []
    
    init(){
        //fetchHeroes()
        fetchCategory()
        fetchTowns()
    }
    
    
// MARK: - Heroes
    func fetchHeroes() {
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
    
    func addHero(id: Int, imageName: String, name: String, heroClass: String, heroSpec: String, heroFirstSkill: String, heroSecondSkill: String?, heroDescription: String) {
        let db = Firestore.firestore()
        let ref = db.collection("Heroes").document(name)
        ref.setData(["id": id,
                     "imageName": imageName,
                     "name": name,
                     "heroClass": heroClass,
                     "heroSpec": heroSpec,
                     "firstSkill": heroFirstSkill,
                     "secondSkill": heroSecondSkill as Any,
                     "heroDescr": heroDescription
                    ]) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
// MARK: - Category
    func fetchCategory() {
        categories.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Categoies")
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
                    
                    let category = Category(id: id, name: name, imageName: imageName)
                    self.categories.append(category)
                }
            }
        }
    }

    // MARK: - Towns
    func fetchTowns() {
        towns.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Towns")
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
                    
                    let town = Town(id: id, name: name, imageName: imageName)
                    self.towns.append(town)
                }
            }
        }
    }

}

