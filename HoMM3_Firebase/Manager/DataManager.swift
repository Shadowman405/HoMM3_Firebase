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
    @Published var artifacts: [Artifact] = []
    @Published var spells: [Spell] = []
    
    init(){
        //fetchHeroes()
        fetchCategory()
        fetchTowns()
        fetchSpells()
        fetchArtifacts()
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
    
// MARK: - Artifacts
    func fetchArtifacts() {
        artifacts.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Artifacts")
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
                    let slot = data["slot"] as? String ?? ""
                    let effect = data["effect"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    
                    let artifact = Artifact(id: id, name: name, imageName: imageName, slot: slot, effect: effect, description: description)
                    self.artifacts.append(artifact)
                }
            }
        }
    }
    
    func addArtifact(id: Int, imageName: String, name: String, slot: String, effect: String, description: String) {
        let db = Firestore.firestore()
        let ref = db.collection("Artifacts").document(name)
        ref.setData(["id": id,
                     "imageName": imageName,
                     "name": name,
                     "slot": slot,
                     "effect": effect,
                     "description": description
                    ]) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }

    // MARK: - Magic
    
    func fetchSpells() {
        spells.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Spells")
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
                    let spellLevel = data["spellLvl"] as? Int ?? 1
                    let spellSchool = data["spellSchool"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    
                    let spell = Spell(id: id, name: name, imageName: imageName, description: description, spellLevel: spellLevel, spellSchool: spellSchool)
                    self.spells.append(spell)
                    print(self.spells)
                }
            }
        }
    }
    
    func addSpell(id: Int, imageName: String, name: String, spellLevel: Int, spellSchool: String, description: String) {
        let db = Firestore.firestore()
        let ref = db.collection("Spells").document(name)
        ref.setData(["id": id,
                     "imageName": imageName,
                     "name": name,
                     "spellLevel": spellLevel,
                     "spellSchool": spellSchool,
                     "description": description
                    ]) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }

}

