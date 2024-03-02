//
//  NoteView.swift
//  NotePad
//
//  Created by Ali Alhasan on 2024-02-29.
//

import SwiftUI

struct NoteView: View {
    
    var titel: String
    @State var note: String
    @ObservedObject var viewModel: NoteViewModel
    var notes: Notes
    @State var isContenViewPresented: Bool = false
    @State var isAlertpresented: Bool = false

    
    var body: some View {
        NavigationStack{
            VStack{
                Text(titel)
                    .padding(30)
                
                TextField("Type here", text: $note, axis: .vertical)
                    .padding(30)
                
                Spacer()
                
                HStack{
                    Button("Spara"){
                        
                        changeNote()
                    }
                    .foregroundStyle(.white)
                    .padding()
                    .background(.purple)
                    .cornerRadius(30)
                    .padding()
                    .alert("An Empty note can not be saved", isPresented: $isAlertpresented){
                        Button("Ok", role: .cancel){}
                    }
                    
                    Button("Ta bort"){
                        
                        removeNote()
                    }
                    .foregroundStyle(.white)
                    .padding()
                    .background(.purple)
                    .cornerRadius(30)
                    .padding()
                    
                    
                }
                
                Button("Tillbaka"){
                    
                    isContenViewPresented = true
                }
                .foregroundStyle(.white)
                .padding()
                .background(.purple)
                .cornerRadius(30)
                
                
            }
            .navigationDestination(isPresented: $isContenViewPresented){
                ContentView() }
                // Ska den vara här eller ?
                                                 
        }
        .navigationBarBackButtonHidden(true)
           
    }
    
    func changeNote(){
        
        if !note.isEmpty{
            
            viewModel.updateNote(entity: notes, newNote: note)
            isContenViewPresented = true 
        }
        
        else{
            isAlertpresented = true
            print("it is not possibale to save an empty note")
        }
    }
    
    func removeNote(){
        
        viewModel.deleteNote(entity: notes)
        isContenViewPresented = true
    }
}
/*
 #Preview {
 NoteView(titel: "Hellosz", note: "This is my note", viewModel: NoteViewModel())
 }
 */
