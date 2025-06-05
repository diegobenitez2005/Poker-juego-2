//
//  RegistroViewController.swift
//  tarea_poker_2
//
//  Created by bootcamp on 2025-05-29.
//

import UIKit

class RegistroViewController: UIViewController {
    
    @IBOutlet weak var registrarCompletado: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
        
    @IBOutlet weak var contrasenhaTextField: UITextField!
    
    @IBOutlet weak var nombreTextField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        [emailTextField, contrasenhaTextField].forEach {
                $0?.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            }

        registrarCompletado.isEnabled = false
        registrarCompletado.alpha = 0.5
        
    }
    
    @IBAction func completadoTapped(_ sender: UIButton) {
        registrarUsuario( correo: emailTextField.text!, contrasena:contrasenhaTextField.text! )
        emailTextField.text = ""
        contrasenhaTextField.text = ""
    }
    
    func registrarUsuario(correo: String, contrasena: String) {
        
//        var usuarios = UserDefaults.standard.dictionary(forKey: "usuarios") as? [String: [String: Any]] ?? [:]
//
//        if usuarios[usuario] != nil {
//            print("Ya existe ese usuario")
//            return
//        }
//
//        let nuevoUsuario: [String: Any] = [
//            "apellido": apellido,
//            "nombre": nombre,
//            "correo": correo,
//            "contrasena": contrasena
//        ]
//
//        usuarios[usuario] = nuevoUsuario
//        UserDefaults.standard.set(usuarios, forKey: "usuarios")
        let email = emailTextField.text ?? "VALOR QUE TIRA ERROR"
        let contrasenha = contrasenhaTextField.text ?? "1234"
        let nombre = nombreTextField.text ?? "Jugador"
        
        AuthApi.registrarUsuario(email,contrasenha,nombre)
        
        
        
        let alerta = UIAlertController(title: "Registro exitoso", message: "Tu cuenta fue creada correctamente.", preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.irLogin()
        }))
        self.present(alerta, animated: true)
    }
    func irLogin () {
        self.dismiss(animated: true, completion: nil)
    }
    func actualizarEstadoDelBoton() {
        let campos = [
            emailTextField.text,
            contrasenhaTextField.text
        ]

        let todosCompletos = campos.allSatisfy { !($0?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true) }

        registrarCompletado.isEnabled = todosCompletos
        registrarCompletado.alpha = todosCompletos ? 1.0 : 0.5
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        actualizarEstadoDelBoton()
    }



}
