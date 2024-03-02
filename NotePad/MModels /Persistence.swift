//
//  Persistence.swift
//  NotePad
//
//  Created by Ali Alhasan on 2024-03-01.
//

import Foundation

import Foundation
import CoreData

struct Persistence{
    static let shared = Persistence()
    
    let container: NSPersistentContainer
    init(){
        container = NSPersistentContainer(name: "NotesModel")
        container.loadPersistentStores{ (description, error) in
            
            if let error = error {
                
                print("Error loading coredata: \(error)")
                
            }
            
            else{
                print("Sucsess!")
            }
            
            
        }
    }
}
