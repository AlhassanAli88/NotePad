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
                Text("Test")
                List{
                    Section{
                        ForEach(myViewModel.notes){notes in
                            
                            NavigationLink{
                                NoteView(titel: notes.titel!, note: notes.note!, viewModel: myViewModel, notes: notes)
                            }
                            
                            label :{
                                Text(notes.titel ?? "no titel")
                            }
                            
                            
                        }.listRowBackground(
                            Capsule()
                                .fill(Color(red: 2, green: 2, blue: 0))
                                .padding(4)
                        
                        
                        )
                    }
                    .listRowSeparator(.hidden)
                    
                }
                .scrollContentBackground(.hidden)
                
                
                
                
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
