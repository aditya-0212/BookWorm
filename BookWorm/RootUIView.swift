//
//  RootUIView.swift
//  BookWorm
//
//  Created by APPLE on 19/07/24.
//

import SwiftUI
import SwiftData

struct RootUIView: View {
    @Environment(\.modelContext) var modelContext
    @Query var students:[Student]
    var body: some View {
        NavigationStack{
            List(students){ student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar{
                Button("add"){
                    let firstName = ["aditya","prawar","gaurav"]
                    let lastName = ["choubisa","mundra","vijawat"]
                    
                    let chooseFirstName = firstName.randomElement()!
                    let chooseLastName = lastName.randomElement()!
                    
                    let student = Student(id: UUID(), name: "\(chooseFirstName) \(chooseLastName)")
                    modelContext.insert(student)
                }
            }
        }
    }
}

#Preview {
    RootUIView()
}
