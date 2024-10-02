//
//  BookPageUI.swift
//  BookWorm
//
//  Created by APPLE on 18/07/24.
//

import SwiftUI
import SwiftData
struct BookPageUIView: View {
    let book:Book
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @State private var showAlert  = false
    var body: some View {
                ScrollView{
                    ZStack(alignment:.bottomTrailing){
                        Image(book.genre)
                            .resizable()
                            .scaledToFit()
                        Text(book.genre)
                            .font(.caption.weight(.black))
                            .padding()
                            .foregroundStyle(.white)
                            .background(.black.opacity(0.75))
                            .clipShape(.capsule)
                            .offset(x: -5,y: -5)
                            
                    }
                    Text(book.author)
                        .font(.title)
                        .padding()
                        .foregroundStyle(.secondary)
                    
                    Text(book.review)
                        .font(.subheadline)
                        .padding()
                    
                    ReviewUIView(rating: .constant(book.rating))
                        .font(.largeTitle)
                        .padding()
                }
                .navigationTitle(book.title)
                .navigationBarTitleDisplayMode(.inline)
                .scrollBounceBehavior(.basedOnSize)
                .toolbar{
                    Button("delete",systemImage: "trash"){
                        showAlert = true
                    }
                }
                .alert("alert",isPresented: $showAlert){
                    Button("delete",role:.destructive,action: deleteButton)
                    Button("cancel",role: .cancel){}
                } message: {
                    Text("are you sure?")
                }
        }
    func deleteButton(){
        modelContext.delete(book)
        dismiss()
    }
}

#Preview {
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self,configurations: config)
        let example = Book(title: "100 days of swiftI", author: "Paul Hudson", genre: "Fantasy", review: "this is the best course for ios development", rating: 4)
        return BookPageUIView(book: example)
            .modelContainer(container)
    }
    catch{
        return Text("the error is \(error.localizedDescription)")
    }
}
