//
//  ListItemMemeber.swift
//  NotePad
//
//  Created by Ali Alhasan on 2024-02-29.
//

import SwiftUI


struct ListItemMemeber: View {
    @State var message: String = ""

    var body: some View {
        ZStack{
            Color(.myYellow)
                .ignoresSafeArea()
                
            Text(message)
            
        }
    }
}

#Preview {
    ListItemMemeber(message: "Hello World")
}
