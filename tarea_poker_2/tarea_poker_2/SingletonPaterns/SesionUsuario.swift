//
//  SesionUsuario.swift
//  tarea_poker_2
//
//  Created by bootcamp on 2025-06-03.
//
import Foundation

class SesionUsuario {
    static let shared = SesionUsuario()
    
    private init() {}

    var accessToken: String?
    var userId: String?
}

