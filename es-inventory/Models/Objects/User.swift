//
//  User.swift
//  es-inventory
//
//  Created by TAM NGUYEN DUC on 10/29/20.
//  Copyright © 2020 TAM NGUYEN DUC. All rights reserved.
//
import Foundation

final class User {
    var name: String
    var age: Int
    var gender: Bool
    
    init(name: String, age: Int, gender: Bool) {
        self.name = name
        self.age = age
        self.gender = gender
    }
}
