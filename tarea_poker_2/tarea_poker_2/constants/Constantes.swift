//
//  constants.swift
//  tarea_poker_2
//
//  Created by bootcamp on 2025-06-03.
//
import Foundation
import Alamofire

class Constantes {
    static let apiKey: String = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imx2bXliY3locmJpc2Zqb3VoYnJ4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDg1Mjk2NzcsImV4cCI6MjA2NDEwNTY3N30.f2t60RjJh91cNlggE_2ViwPXZ1eXP7zD18rWplSI4jE"
    
    static let headersValidaciones: HTTPHeaders = [
        "apikey": Constantes.apiKey,
        "Content-Type": "application/json"
    ]
}
