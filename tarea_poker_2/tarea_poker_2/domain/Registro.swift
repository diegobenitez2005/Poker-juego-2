//
//  File.swift
//  tarea_poker_2
//
//  Created by bootcamp on 2025-06-03.
//

import Foundation

struct RegistroModel: Codable {
    let email: String
    let password: String
    let user_metadata: UserMetadata?
}

struct UserMetadata: Codable {
    let nombre: String?
}


