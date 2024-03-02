//
//  ContentView.swift
//  NotePad
//
//  Created by Ali Alhasan on 2024-02-28.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var myViewModel: NoteViewModel = NoteViewModel()
    
    
    
    var body: some View {
        NavigationView{
            
            VStack {
                Text("Anteckningslistan")
                //Spacer()
                
                List{
                    
                    ForEach(myViewModel.notes){notes in
                        
                            NavigationLink{
                                NoteView(titel: notes.titel!, note: notes.note!, viewModel: myViewModel, notes: notes)
                            }
                            
                            label :{
                                Text(notes.titel ?? "no titel")
                            }
                            
     
                    }
                    
                }
                
                
                
                
                NavigationLink(destination: AddView(viewModel: myViewModel),
                                
                   label: {
                    Text("Lägg till nya anteckningar")
                        .foregroundStyle(.white)
                        .padding()
                        .background(.purple)
                        .cornerRadius(30)
                        .padding()
                })
            }
            .padding()
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
