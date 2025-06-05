//
//  GetUserScore.swift
//  tarea_poker_2
//
//  Created by bootcamp on 2025-06-05.
//
import Foundation
import Alamofire

// Modelo para scores por usuario (misma estructura que el GET general)

// Repositorio para obtener scores de un usuario específico
class UserScoreRepo {
    
    // Método para obtener scores de un usuario específico
    static func obtenerScoresPorUsuario(userId: String, completion: @escaping ([UserScoreResponse]) -> Void) {
        let userId = SesionUsuario.shared.userId
        let url = "https://lvmybcyhrbisfjouhbrx.supabase.co/rest/v1/scores?user_id=eq.\(userId ?? "hola")"
        
        AF.request(url,
                   method: .get,
                   headers: Constantes.headerSencillo)
        .validate()
        .responseData { response in
            switch response.result {
            case .success(let data):
                print("Scores del usuario obtenidos exitosamente")
                let scores = decodeUserScores(from: data)
                completion(scores)
                
            case .failure(let error):
                print("Error al obtener scores del usuario: \(error)")
                
                if let httpResponse = response.response {
                    print("Código HTTP: \(httpResponse.statusCode)")
                }
                
                if let data = response.data {
                    print("Respuesta: \(String(data: data, encoding: .utf8) ?? "No legible")")
                }
                
                completion([])
            }
        }
    }
    
    // Método alternativo: obtener scores por usuario y game_id
    
    
    static func decodeUserScores(from data: Data) -> [UserScoreResponse] {
        do {
            let decoded = try JSONDecoder().decode([UserScoreResponse].self, from: data)
            print("✅ Decodificación exitosa: \(decoded.count) scores del usuario")
            return decoded
            
        } catch {
            print("❌ Error al decodificar scores del usuario: \(error)")
            
            if let jsonString = String(data: data, encoding: .utf8) {
                print("JSON recibido: \(jsonString)")
            }
            
            return []
        }
    }
}
