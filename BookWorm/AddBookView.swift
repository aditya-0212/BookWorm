//
//  AddBookView.swift
//  BookWorm
//
//  Created by APPLE on 18/07/24.
//

import SwiftUI
import SwiftData

struct AddBookView: View {
    @Environment(\.modelContext) var modelContaxt
    @Environment(\.dismiss) var dismiss
    @State private var bookTitle = ""
    @State private var authorName = ""
    @State private var genre = "Fantacy"
    @State private var review = ""
    @State private var rating = 3
    let genreArray = ["Fantasy","Horror","Kids","Mystery","Poetry","Romance","Thriller"]
    var body: some View {
        NavigationStack{
                Form{
                    Section{
                        TextField("Book's Title",text: $bookTitle)
                        TextField("Author's Name",text: $authorName)
                        Picker("Genre",selection: $genre){
                            ForEach(genreArray,id: \.self){ item in
                                Text(item)
                            }
                        }
                    }
                    Section("WRITE A REVIEW"){
                        TextEditor(text: $review)
                        ReviewUIView(rating: $rating)
                    }
                    
                    
                   HStack{
                        Button("save"){
                           let newBook = Book(title: bookTitle, author: authorName, genre:genre , review: review, rating: rating)
                            modelContaxt.insert(newBook)
                           dismiss()
                        }
                        
                    }
           }
            .navigationTitle("Add Book")
          
        }
    }
}

#Preview {
    AddBookView()
}
