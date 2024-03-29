//
//  DetailView.swift
//  BookWorm
//
//  Created by Godwin IE on 15/01/2024.
//

import SwiftData
import SwiftUI

struct DetailView: View {
    @Environment (\.modelContext) var modelContext
    @Environment (\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    let book: Book
    
    var body: some View {
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    Image(book.genre)
                        .resizable()
                        .scaledToFit()
                    
                    Text(book.genre.uppercased())
                        .fontWeight(.black)
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(.black.opacity(0.76))
                        .clipShape(.capsule)
                        .offset(x: -5, y: -5)
                } //zstack
                
                Text(book.author)
                    .font(.title.bold())
                    .foregroundStyle(.secondary)
                
                Text(book.review)
                    .padding()
                
                RatingView(rating: .constant(book.rating))
                    .font(.title)
                
                Text(formatDate())
                    .padding()
                    .font(.callout)
                
            } //scrollview
            .navigationTitle(book.title)
            .navigationBarTitleDisplayMode(.inline)
            .scrollBounceBehavior(.basedOnSize)
            .alert("Delete book", isPresented: $showingDeleteAlert) {
                Button("Delete", role: .destructive, action: deleteBook)
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("Are you sure")
            }
            .toolbar{
                Button("Delete this book", systemImage: "trash") {
                    showingDeleteAlert = true
                }
            }
    }
    func deleteBook() {
        modelContext.delete(book)
        dismiss()
    }
    
    func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter.string(from: book.date)
    }
    
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Test book", author: "Godwin Ebri", genre: "Fantasy", review: "Awesome book, awesome author. I enjoyed this one", rating: 4)
        
        return DetailView(book: example)
            .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
