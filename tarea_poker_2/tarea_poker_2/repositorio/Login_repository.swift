//
//  Login_repository.swift
//  tarea_poker_2
//
//  Created by bootcamp on 2025-06-03.
//
import Foundation
import Alamofire

class AuthLogin {
    static func iniciarSesion(_ email: String, _ password: String, completion: @escaping (_ exito: Bool, _ mensaje: String, _ statusCode: Int?, _ nombre: String?) -> Void) {
        let nuevaSesion = LoginModel(email: email, password: password)
        
        AF.request("https://lvmybcyhrbisfjouhbrx.supabase.co/auth/v1/token?grant_type=password",
                   method: .post,
                   parameters: nuevaSesion,
                   encoder: JSONParameterEncoder.json,
                   headers: Constantes.headerSencillo)
        .validate().response { response in
            let statusCode = response.response?.statusCode
            switch response.result {
            case .success(let data):
                if let data = data, let loginResponse = decodeLoginResponse(from: data) {
                    SesionUsuario.shared.accessToken = loginResponse.access_token
                    SesionUsuario.shared.userId = loginResponse.user.id
                    SesionUsuario.shared.nombre = loginResponse.user.user_metadata?.nombre
                    completion(true, "Login exitoso", statusCode, loginResponse.user.user_metadata?.nombre)

                } else {
                    completion(false, "Error al decodificar", statusCode,"hola")
                }

            case .failure(let error):
                print("Error: \(error)")
                completion(false, "Fallo la solicitud", statusCode,"hola")
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

