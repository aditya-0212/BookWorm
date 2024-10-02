//
//  Student.swift
//  BookWorm
//
//  Created by APPLE on 19/07/24.
//

import Foundation
import SwiftData

@Model
class Student{
    var id:UUID
    var name:String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
