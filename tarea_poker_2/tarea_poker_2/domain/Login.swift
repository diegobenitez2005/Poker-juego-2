//
//  Login.swift
//  tarea_poker_2
//
//  Created by bootcamp on 2025-06-03.
//
import Foundation

struct LoginModel: Codable {
    let email:String
    let password: String
//    let user_metadata: UserMetadataLogin?
        
}

struct LoginResponse: Decodable {
    let access_token: String
    let user: User
}

struct User: Decodable {
    let id: String
    let user_metadata: UserMetadataLogin?
}

struct UserMetadataLogin: Codable {
    let nombre: String?
}
