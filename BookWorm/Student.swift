//
//  Student.swift
//  BookWorm
//
//  Created by Godwin IE on 03/01/2024.
//

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
