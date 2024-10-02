//
//  ContentView.swift
//  BookWorm
//
//  Created by APPLE on 18/07/24.
//

import SwiftUI
import SwiftData

struct ContentView:View {
    @Environment(\.modelContext) var modelContext
    @Query(sort:[
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.rating)
        ]) var books:[Book]
    @State private var showSheet = false
    var body: some View {
        NavigationStack{
//        List{
            List {
            ForEach(books){ book in
                NavigationLink(value:book){
                    HStack{
                        EmojiUIView(rating: book.rating)
                            .font(.largeTitle)
                        VStack(alignment: .leading){
                            Text(book.title)
                                .font(.headline)
                            Text(book.author)
                                .foregroundStyle(.secondary)
                        }
                    }
                    }
                }
            .onDelete(perform: { indexSet in
                for offSet in indexSet{
                    let book = books[offSet]
                    
                    modelContext.delete(book)
                    }
                }
            )
           
            }
            .navigationTitle("Bookworm")
            .navigationDestination(for: Book.self){ book in
                BookPageUIView(book: book)
            }
            .sheet(isPresented: $showSheet){
                AddBookView()
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button("Add Button",systemImage: "plus"){
                        showSheet.toggle()
                    }
                    .font(.title)
                }
                ToolbarItem(placement: .topBarLeading){
                    EditButton()
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
