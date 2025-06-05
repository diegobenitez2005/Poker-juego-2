//
//  GetListOfScores.swift
//  tarea_poker_2
//
//  Created by bootcamp on 2025-06-04.
//


struct ListOfScoresModel: Decodable {
    let id: Int
    let user_id: String
    let game_id: Int
    let created_at: String
    let score: Int
    let date: String
}

