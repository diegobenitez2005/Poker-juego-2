//
//  loginScreenController.swift
//  tarea_poker_2
//
//  Created by bootcamp on 2025-05-28.
//

import UIKit

class LoginScreenController: UIViewController {
    
    let buttonLogin = UIButton()
    let userTextField = UITextField()
    let passwordTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        builder()
        buttonLogin.addTarget(self, action: #selector(validarLogin), for: .touchUpInside)
        userTextField.addTarget(self, action: #selector(verificarCampos), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(verificarCampos), for: .editingChanged)
        if let usuarios = UserDefaults.standard.dictionary(forKey: "usuarios") {
            print("Usuarios guardados:", usuarios)
        } else {
            print("No hay usuarios guardados en UserDefaults.")
        }

    }
    func builder() {
        let userLabel = UILabel()
        userLabel.text = "Usuario"
        userLabel.font = UIFont.systemFont(ofSize: 16)
        
        let passwordLabel = UILabel()
        passwordLabel.text = "Contraseña"
        passwordLabel.font = UIFont.systemFont(ofSize: 16)
        
        let textFieldAncho:CGFloat =  160
        let textFieldAltura:CGFloat = 50
        
        //let userTextField = UITextField()
        userTextField.placeholder = "Ingrese su usuario"
        userTextField.borderStyle = .roundedRect
        userTextField.widthAnchor.constraint(equalToConstant: textFieldAncho).isActive = true
        userTextField.heightAnchor.constraint(equalToConstant: textFieldAltura).isActive = true
        
        //let passwordTextField = UITextField()
        passwordTextField.placeholder = "Ingrese su contraseña"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.widthAnchor.constraint(equalToConstant: textFieldAncho).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: textFieldAltura).isActive = true
        passwordTextField.textContentType = .password
        passwordTextField.isSecureTextEntry = true
        
        let stackUser = UIStackView(arrangedSubviews: [userLabel, userTextField])
        stackUser.axis = .vertical
        stackUser.spacing = 5
        
        let stackPassword = UIStackView(arrangedSubviews:[passwordLabel,passwordTextField])
        stackPassword.axis = .vertical
        stackPassword.spacing = 5
        
        let stackPrincipal = UIStackView(arrangedSubviews: [stackUser,stackPassword])
        stackPrincipal.axis = .vertical
        stackPrincipal.spacing = 15
     
        buttonLogin.setTitle ("Iniciar sesion" , for: .normal)
        buttonLogin.backgroundColor = .systemBlue
        buttonLogin.layer.cornerRadius = 50/2
        
        
        let buttonRegistro = UIButton(type: .system)

        let titulo = "No tengo una cuenta"
        let atributos: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .foregroundColor: UIColor.systemBlue
        ]

        let textoSubrayado = NSAttributedString(string: titulo, attributes: atributos)

        buttonRegistro.setAttributedTitle(textoSubrayado, for: .normal)
        buttonRegistro.addTarget(self, action: #selector(irARegistro), for: .touchUpInside)

        view.addSubview(stackPrincipal)
        view.addSubview(buttonLogin)
        view.addSubview(buttonRegistro)
        
        NSLayoutConstraint.activate([
            stackPrincipal.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            stackPrincipal.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackPrincipal.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackPrincipal.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            buttonLogin.topAnchor.constraint(equalTo: stackPrincipal.bottomAnchor, constant: 30),
            buttonLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonLogin.widthAnchor.constraint(equalToConstant: 160),
            buttonLogin.heightAnchor.constraint(equalToConstant: 50),
            
            buttonRegistro.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 30),
            buttonRegistro.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonRegistro.widthAnchor.constraint(equalToConstant: 200),
            buttonRegistro.heightAnchor.constraint(equalToConstant: 50)
        ]
        )
        stackPrincipal.translatesAutoresizingMaskIntoConstraints = false
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        buttonRegistro.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func irARegistro() {
        performSegue(withIdentifier: "registroVC", sender: self)
    }
    
    @objc func validarLogin() {
        guard let usuarioIngresado = userTextField.text,
              let contrasenaIngresada = passwordTextField.text else {
            return
        }

        if let usuariosRegistrados = UserDefaults.standard.dictionary(forKey: "usuarios") as? [String: [String: Any]] {
            
            if let datosUsuario = usuariosRegistrados[usuarioIngresado],
               let contrasenaGuardada = datosUsuario["contrasena"] as? String {
                
                if contrasenaGuardada == contrasenaIngresada {
                    //  Login exitoso
                    performSegue(withIdentifier: "homeVC", sender: self)
                } else {
                    mostrarAlerta(mensaje: "La contraseña es incorrecta.")
                }
            } else {
                mostrarAlerta(mensaje: "El usuario no está registrado.")
            }
            
        } else {
            mostrarAlerta(mensaje: "No hay usuarios registrados.")
        }
    }
    
    func mostrarAlerta(titulo: String = "Error", mensaje: String) {
        let alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "OK", style: .default))
        present(alerta, animated: true)
    }
    
    @objc func verificarCampos() {
        let usuarioVacio = userTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true
        let contrasenaVacia = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true

        buttonLogin.isEnabled = !(usuarioVacio || contrasenaVacia)
        buttonLogin.alpha = buttonLogin.isEnabled ? 1.0 : 0.5
    }
}
