//
//  GetUserScoreModel.swift
//  tarea_poker_2
//
//  Created by bootcamp on 2025-06-05.
//
class UserScoreResponse: Codable {
    let id: Int           //  Generado por Supabase
    let user_id: String
    let game_id: Int      // Supabase lo convierte a Int
    let created_at: String // ← Generado por Supabase
    let score: Int
    let date: String
}
