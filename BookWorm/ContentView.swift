//
//  ContentView.swift
//  BookWorm
//
//  Created by Godwin IE on 18/12/2023.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack{
            Text("Books: \(books.count)")
                .navigationTitle("Bookworm")
                .toolbar{
                    ToolbarItem(placement: .topBarLeading){
                        Button{
                            showingAddScreen.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    
                }
            
                .sheet(isPresented: $showingAddScreen) {
                    AddBookView()
                }
        }
    }
}

#Preview {
    ContentView()
}
