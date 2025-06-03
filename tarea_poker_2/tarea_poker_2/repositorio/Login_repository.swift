//
//  Login_repository.swift
//  tarea_poker_2
//
//  Created by bootcamp on 2025-06-03.
//
import Foundation
import Alamofire

class AuthLogin {
    static func iniciarSesion(_ email: String, _ password:String) {
        let nuevaSesion = LoginModel(email: email, password: password)
        
        AF.request("https://lvmybcyhrbisfjouhbrx.supabase.co/auth/v1/token?grant_type=password",
                   method: .post,
                   parameters: nuevaSesion,
                   encoder: JSONParameterEncoder.json,
                   headers: Constantes.headersValidaciones)
        .validate().response {
            response in
            switch response.result {
            case .success(let data):
                print("Login exitoso.")
                if let data = data {
                    print(String(data: data, encoding: .utf8) ?? "No se pudo mostrar la respuesta")
                    if let loginResponse = decodeLoginResponse(from: data) {
                        SesionUsuario.shared.accessToken = loginResponse.access_token
                        SesionUsuario.shared.userId = loginResponse.user.id
                        
                        print("Access Token: \(loginResponse.access_token)")
                        print("User ID: \(loginResponse.user.id)")
                    }
                }
            case .failure(let error):
                print("Error en el login: \(error)")
            }
        }
    }
}
func decodeLoginResponse(from data: Data) -> LoginResponse? {
    do {
        let decoded = try JSONDecoder().decode(LoginResponse.self, from: data)
        return decoded
    } catch {
        print("Error al decodificar: \(error)")
        return nil
    }
}
