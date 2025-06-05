//
//  puntajesUsuario_repository.swift
//  tarea_poker_2
//
//  Created by bootcamp on 2025-06-04.
//
import Foundation
import Alamofire

class ListScoreRepo {
    static func obtenerScores(completion: @escaping ([ListOfScoresModel]) -> Void) {
        let url = "https://lvmybcyhrbisfjouhbrx.supabase.co/rest/v1/scores"

        
        AF.request(url,
                   method: .get,
                   headers: Constantes.headerSencillo).response { response in
            switch response.result {
            case .success(let data):
                if let data = data {
                    let scores = decodeScores(from: data)
                    completion(scores)
                } else {
                    print("No se recibio data")
                    completion([])
                }

            case .failure(let error):
                print("Error en la solicitud: \(error)")
                completion([])
            }
        }
    }
}

func decodeScores(from data: Data) -> [ListOfScoresModel] {
    do {
        let decoded = try JSONDecoder().decode([ListOfScoresModel].self, from: data)
        return decoded
    } catch {
        print("Error al decodificar scores: \(error)")
        return []
    }
}
