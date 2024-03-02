//
//  NoteViewModel.swift
//  NotePad
//
//  Created by Ali Alhasan on 2024-03-01.
//


import Foundation
import CoreData

class NoteViewModel: ObservableObject{
    
    @Published var notes: [Notes] = []
                    
    
    var container = Persistence.shared.container
    
    init(){
        
        fetchNotes()
    }
    
    
    func fetchNotes(){
        
        let request = NSFetchRequest<Notes>(entityName: "Notes")
        
        do {
            notes = try container.viewContext.fetch(request)
            
        } catch let error {
            print("error fetching: \(error)")
        }
    }
    
    
    
    func addNote(titel: String, note: String){
        let newNote = Notes(context: container.viewContext)
        newNote.titel = titel
        newNote.note = note
        
        saveData()
    }
    
    
    
    func updateNote(entity: Notes, newNote: String){
            
        entity.note  = newNote
            
            saveData()
        }

    
        
        func deleteNote(entity: Notes){
            container.viewContext.delete(entity)
            saveData()
        }
    

        
        func saveData(){
            do {
               try container.viewContext.save()
            } catch let error{
                print("error adding person \(error)")
            }
            fetchNotes()
        }
}

