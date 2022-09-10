//
//  DataManager.swift
//  HoMM3_Firebase
//
//  Created by Maxim Mitin on 10.09.22.
//

import SwiftUI
import Firebase

class DataManager: ObservableObject {
    @Published var dogs: [Hero] = []
    
    init(){
        fetchDogs()
    }
    
    func fetchDogs() {
        dogs.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Dogs")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? Int ?? 0
                    let name = data["name"] as? String ?? ""
                    
                    let dog = Hero(id: id, name: name)
                    self.dogs.append(dog)
                }
            }
        }
    }
    
    func addDog(dogBreed: String) {
        let db = Firestore.firestore()
        let ref = db.collection("Dogs").document(dogBreed)
        ref.setData(["breed": dogBreed, "id": Int.random(in: 6..<10000)]) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}

