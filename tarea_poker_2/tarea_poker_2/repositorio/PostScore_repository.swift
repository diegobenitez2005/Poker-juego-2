//
//  PostScore_repository.swift
//  tarea_poker_2
//
//  Created by bootcamp on 2025-06-04.
//

import Alamofire


actor PostScoreRepo {
    static func SendUserScore(_ userId: String, _ gameId: String, _ score: Int, _ date: String ) {
        let nuevoPuntaje = PostUserScoreModel (user_id: userId, game_id: gameId, score: score, date: date)
        
        AF.request(
            "https://lvmybcyhrbisfjouhbrx.supabase.co/rest/v1/scores",
            method: .post,
            parameters: nuevoPuntaje,
            encoder: JSONParameterEncoder.json,
            headers: Constantes.headersUserPost
        )
        .validate().response
        { response in
            switch response.result {
            case .success(let data):
                print("Registro exitoso.")
                if let data = data {
                    print(String(data: data, encoding: .utf8) ?? "No se pudo mostrar la respuesta")
                }
                
            case .failure(let error):
                print("Error en el registro: \(error)")
            }
        }
    }
}
