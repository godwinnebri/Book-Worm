//
//  AddBookView.swift
//  BookWorm
//
//  Created by Godwin IE on 04/01/2024.
//

import SwiftUI

struct AddBookView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var genre = "Fantasy"
    @State private var rating = 3
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review"){
                    TextEditor(text: $review)
                    
                    RatingView(rating: $rating)
                }
                
                Section{
                    Button("Save") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        
                        modelContext.insert(newBook)
                        dismiss()
                    }
                    .disabled(ValidateFields())
                }
                
            }
            .navigationTitle("Add book")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func ValidateFields() -> Bool {
        if title.isEmpty || author.isEmpty {
            return true
        } else {
            return false
        }
    }
}

#Preview {
    AddBookView()
}
