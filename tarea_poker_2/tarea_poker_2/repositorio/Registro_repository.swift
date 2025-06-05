//
//  Registro_repository.swift
//  tarea_poker_2
//
//  Created by bootcamp on 2025-06-03.
//
import Foundation
import Alamofire
class AuthApi {
    
    static func registrarUsuario(_ email: String, _ pass: String, _ nombre: String?) {
        let nuevoRegistro = RegistroModel(email: email, password: pass,user_metadata: UserMetadata(nombre: nombre)
)
        
        AF.request(
            "https://lvmybcyhrbisfjouhbrx.supabase.co/auth/v1/signup",
            method: .post,
            parameters: nuevoRegistro,
            encoder: JSONParameterEncoder.json,
            headers: Constantes.headerSencillo
        )
        .response
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
