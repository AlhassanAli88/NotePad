//
//  AddView.swift
//  NotePad
//
//  Created by Ali Alhasan on 2024-02-29.
//

import SwiftUI

struct AddView: View {
    
    @State var title: String = ""
    @State var note: String = ""
    @ObservedObject var viewModel: NoteViewModel
    @State var isContenViewPresented: Bool = false
    @State var isAlertpresented: Bool = false


    var body: some View {
        NavigationStack{
            VStack{
                
                TextField("Titel", text: $title)
                    .padding(15)
                
                TextField("Anteckning", text: $note)
                    .padding(15)
                
                Spacer()
                
                HStack{
                    Button(action: {
                        addNote()
                        
                                                
                    }, label: {
                        Text("Spara")
                            .foregroundStyle(.white)
                            .padding()
                            .background(.purple)
                            .cornerRadius(30)
                            .padding()
                    })
                    .alert("Titel or note missing", isPresented: $isAlertpresented){
                        Button("Ok", role: .cancel){}
                    }
                    
                    
                    Button(action: {
                        
                        isContenViewPresented = true
                        
                    }, label: {
                        Text("Tillbaka")
                            .foregroundStyle(.white)
                            .padding()
                            .background(.purple)
                            .cornerRadius(30)
                            .padding()
                    })
                   
                }
                
            }
            .padding()
            .navigationDestination(isPresented: $isContenViewPresented){
                ContentView()
            // Ska den vara här eller ?
            }
            
        
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func addNote(){
        if title.isEmpty || note.isEmpty {
            
            isAlertpresented = true
            print("titel or note missing")
        }
        else {
            viewModel.addNote(titel: title, note: note)
            isContenViewPresented = true
        }
    }
    
}

#Preview {
    AddView(viewModel: NoteViewModel())
}


/*
 NavigationLink(destination: ContentView(), isActive: $isContenViewActive) {
     EmptyView()
 }
 
 
 HStack{
     Button(action: {
         addNote()
        isContenViewActive = true
         
                                 
     }, label: {
         Text("Spara")
             .foregroundStyle(.white)
             .padding()
             .background(.purple)
             .cornerRadius(30)
             .padding()
     })
 */
/*
struct Option2: View {
    @State private var isPresented = false
    var body: some View {
        
        
        
        NavigationStack() {
            List {
                Button("hello"){
                    isPresented = true
                }
                .navigationDestination(isPresented: $isPresented){
                    //SayingsDetail(sayings: "hi")
                }
            }
        }
        
        
      
        
        
        
        
        
    }
}
*/
