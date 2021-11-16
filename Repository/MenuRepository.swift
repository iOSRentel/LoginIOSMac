//
//  CardRepository.swift
//  LoginIOSMac (iOS)
//
//  Created by Boris Zinovyev on 16.11.2021.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

final class MenuRepository: ObservableObject {
    private let path = "menuCards"
    private let store = Firestore.firestore()
    @Published var menuCards: [Menu] = []
    
    init() {
        get()
    }
    
    func get() {
        store.collection(path).addSnapshotListener { (snapshot, error) in
            if let error = error {
                print(error)
                return
            }
            self.menuCards = snapshot?.documents.compactMap {
                try? $0.data(as: Menu.self)
            } ?? []
        }
    }
    
    func add(_ menuCard: Menu) {
        do {
            _ = try store.collection(path).addDocument(from: menuCard)
            
            } catch {
                fatalError("Adding a study card failed")
        }
    }
    
    func remove(_ menuCard: Menu) {
        guard let documentId = menuCard.id else { return }
        store.collection(path).document(documentId).delete { error in
            if let error = error {
                print("Unable to remove the card: \(error.localizedDescription)")
            }
        }
    }
    func update(_ menuCard: Menu) {
        guard let documentId = menuCard.id else { return }
        do {
            try store.collection(path).document(documentId).setData(from:
            menuCard)
            } catch {
                fatalError("Updating a study card failed")
            
        }
    }
}
