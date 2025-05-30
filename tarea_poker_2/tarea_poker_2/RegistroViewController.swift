//
//  RegistroViewController.swift
//  tarea_poker_2
//
//  Created by bootcamp on 2025-05-29.
//

import UIKit

class RegistroViewController: UIViewController {
    
    @IBOutlet weak var registrarCompletado: UIButton!
    
    @IBOutlet weak var apellidoTextField: UITextField!
    
    @IBOutlet weak var nombreTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var usuarioTextField: UITextField!
    
    @IBOutlet weak var contrasenhaTextField: UITextField!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
    }
    @IBAction func completadoTapped(_ sender: UIButton) {
        registrarUsuario(usuario: usuarioTextField.text!,apellido: apellidoTextField.text!, nombre: nombreTextField.text!, correo: emailTextField.text!, contrasena:contrasenhaTextField.text! )
    }
    
    func registrarUsuario(usuario: String, apellido: String,nombre: String, correo: String, contrasena: String) {
        
        var usuarios = UserDefaults.standard.dictionary(forKey: "usuarios") as? [String: [String: Any]] ?? [:]

        if usuarios[usuario] != nil {
            print("Ya existe ese usuario")
            return
        }

        let nuevoUsuario: [String: Any] = [
            "apellido": apellido,
            "nombre": nombre,
            "correo": correo,
            "contrasena": contrasena
        ]

        usuarios[usuario] = nuevoUsuario
        UserDefaults.standard.set(usuarios, forKey: "usuarios")

        print("Usuario registrado con éxito")
        apellidoTextField.text = ""
        nombreTextField.text = ""
        emailTextField.text = ""
        usuarioTextField.text = ""
        contrasenhaTextField.text = ""
        performSegue(withIdentifier: "goToLoginVC", sender: self)
    }

}
