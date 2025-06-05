//
//  SecondViewController.swift
//  tarea_poker_2
//
//  Created by bootcamp on 2025-05-26.
//

//import UIKit
//
//class SelectorJuegoController: UIViewController {
//    @IBOutlet weak var gamePicker: UITextField!
//    
//    var username: String?
//    var pokerTituloAlert: String = "Póker es un juego clásico de cartas donde el objetivo es formar la mejor mano posible para ganar la partida."
//    var pokerReglas:String = """
//    Reglas básicas:
//    1. Cada jugador recibe 5 cartas al comienzo de la partida.
//    2. Cada jugador puede cambiar hasta 3 cartas para mejorar su mano.
//    3. Las combinaciones de cartas, de mayor a menor valor, son las siguientes:
//      - Escalera Real (A, K, Q, J, 10 del mismo palo)
//      - Escalera de Color (cinco cartas consecutivas del mismo palo)
//      - Póker (cuatro cartas del mismo número)
//      - Full (un trío y una pareja)
//      - Color (cinco cartas del mismo palo)
//      - Escalera (cinco cartas consecutivas de cualquier palo)
//      - Trío (tres cartas del mismo número)
//      - Doble Pareja (dos pares)
//      - Pareja (dos cartas del mismo número)
//      - Carta Alta (cuando no se forma ninguna combinación)
//    4. Gana el jugador que tenga la mejor mano al final de la partida.
//"""
//    var tocameTituloAlert: String = "Bienvenido a Tócame. Este es un juego rápido y sencillo que pone a prueba tu velocidad de reacción."
//    
//    var tocameReglas: String =  """
//    Reglas básicas:
//    1. Selecciona el juego “Tócame” en el menú de inicio.
//    2. Espera a que el botón aparezca en la pantalla.
//    3. Toca el botón lo más rápido que puedas.
//    4. Tu tiempo de reacción se convierte en tu puntaje.
//    5. Guarda tus puntajes y compite contigo mismo para mejorar cada vez más.
//    """
//
//
//
//
//
//
//    @IBOutlet weak var labelUser: UILabel!
//    
//    @IBOutlet weak var jugarBoton: UIButton!
//    @IBOutlet weak var ayudaButton: UIButton!
//    
//    let games = ["Poker","Tocame"]
//    var pickerView = UIPickerView()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        pickerView.delegate = self
//        pickerView.dataSource = self
//        //gamePicker.inputView = pickerView
//        labelUser.text = username
//        
//    }
//    
//    @IBAction func jugarOpciones (_ sender: Any) {
//        if gamePicker.text == "Poker" {
//            performSegue(withIdentifier: "goToPokerScreen" , sender: self)
//        }
//        else {
//            performSegue(withIdentifier: "goToTocameScreen", sender: self)
//        }
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "goToPokerScreen" {
//            if let destination = segue.destination as? PokerController {
//                destination.nombreUsuario1 = username
//            }
//        } else if segue.identifier == "goToTocameScreen" {
//            if let destino = segue.destination as? TocameController {
//                destino.nombreUsuario1 = username
//            }
//        }
//    }
//    @IBAction func mostrarAyuda(_ sender: UIButton) {
//        if gamePicker.text == "Poker" {
//            mostrarAlerta(pokerTituloAlert,pokerReglas)
//        }
//        else {
//            mostrarAlerta(tocameTituloAlert,tocameReglas)
//        }
//    }
//   
//        func mostrarAlerta(_ titulo: String, _ mensaje: String) {
//            let alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
//            alerta.addAction(UIAlertAction(title: "OK", style: .default))
//            present(alerta, animated: true)
//        }
//}
//
//
//    
//
//extension SelectorJuegoController: UIPickerViewDelegate, UIPickerViewDataSource {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    func pickerView (_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return games.count
//    }
//    func pickerView (_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return games[row]
//    }
//    func pickerView (_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int ) {
//        
//        gamePicker.text = games[row]
//        gamePicker.resignFirstResponder()
//        //self.view.endEditing(true)
//    }
//}

import UIKit

class SelectorJuegoController: UIViewController, UIScrollViewDelegate {
    var pokerTituloAlert: String = "Póker es un juego clásico de cartas donde el objetivo es formar la mejor mano posible para ganar la partida."
        var pokerReglas:String = """
       Reglas básicas:
       1. Cada jugador recibe 5 cartas al comienzo de la partida.
       2. Cada jugador puede cambiar hasta 3 cartas para mejorar su mano.
       3. Las combinaciones de cartas, de mayor a menor valor, son las siguientes:
        - Escalera Real (A, K, Q, J, 10 del mismo palo)
        - Escalera de Color (cinco cartas consecutivas del mismo palo)
        - Póker (cuatro cartas del mismo número)
        - Full (un trío y una pareja)
        - Color (cinco cartas del mismo palo)
        - Escalera (cinco cartas consecutivas de cualquier palo)
        - Trío (tres cartas del mismo número)
        - Doble Pareja (dos pares)
        - Pareja (dos cartas del mismo número)
        - Carta Alta (cuando no se forma ninguna combinación)
       4. Gana el jugador que tenga la mejor mano al final de la partida.
    """
       var tocameTituloAlert: String = "Bienvenido a Tócame. Este es un juego rápido y sencillo que pone a prueba tu velocidad de reacción."
    
       var tocameReglas: String =  """
       Reglas básicas:
       1. Selecciona el juego “Tócame” en el menú de inicio.
       2. Espera a que el botón aparezca en la pantalla.
       3. Toca el botón lo más rápido que puedas.
       4. Tu tiempo de reacción se convierte en tu puntaje.
       5. Guarda tus puntajes y compite contigo mismo para mejorar cada vez más.
    """

    let titulo1 = UILabel()
    let titulo2 = UILabel()
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    let imagen1 = UIImageView(image: UIImage(named: "img1"))
    let imagen2 = UIImageView(image: UIImage(named: "img2"))
    
    let btnIzquierda = UIButton(type: .system)
    let btnDerecha = UIButton(type: .system)
    
    let pageControl = UIPageControl()
    let btnJugar = UIButton(type: .system)
    let btnAyuda = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configurarLabels()
        configurarScrollView()
        configurarBotonesNavegacion()
        configurarPageControl()
        configurarBotonesInferiores()
        scrollView.setContentOffset(.zero, animated: false)
        btnJugar.addTarget(self, action: #selector(jugarTapped), for: .touchUpInside)
        btnAyuda.addTarget(self, action: #selector(ayudaTapped), for: .touchUpInside)


    }
    
    func configurarLabels() {
        [titulo1, titulo2].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.textAlignment = .center
            $0.font = UIFont.boldSystemFont(ofSize: 20)
            view.addSubview($0)
        }
        
        titulo1.text = "Título 1"
        titulo2.text = "Título 2"
        
        NSLayoutConstraint.activate([
            titulo1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titulo1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titulo2.topAnchor.constraint(equalTo: titulo1.bottomAnchor, constant: 2),
            titulo2.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    func configurarScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: titulo2.bottomAnchor, constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            scrollView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(stackView)
        
        [imagen1, imagen2].forEach {
            $0.contentMode = .scaleAspectFit
            stackView.addArrangedSubview($0)
        }

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 2) // porque hay 2 imágenes
        ])

    }

    func configurarBotonesNavegacion() {
        [btnIzquierda, btnDerecha].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.setTitleColor(.systemBlue, for: .normal)
            view.addSubview($0)
        }

        btnIzquierda.setTitle("←", for: .normal)
        btnDerecha.setTitle("→", for: .normal)
        btnIzquierda.addTarget(self, action: #selector(irIzquierda), for: .touchUpInside)
        btnDerecha.addTarget(self, action: #selector(irDerecha), for: .touchUpInside)

        NSLayoutConstraint.activate([
            btnIzquierda.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            btnIzquierda.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            btnDerecha.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            btnDerecha.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
        actualizarBotones()
    }

    func configurarPageControl() {
        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)

        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 10),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    func configurarBotonesInferiores() {
        btnJugar.setTitle("Jugar", for: .normal)
        btnJugar.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        btnJugar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(btnJugar)

        btnAyuda.setTitle("Ayuda", for: .normal)
        btnAyuda.setTitleColor(.systemBlue, for: .normal)
        btnAyuda.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btnAyuda.titleLabel?.attributedText = NSAttributedString(
            string: "Ayuda",
            attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue]
        )
        btnAyuda.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(btnAyuda)

        NSLayoutConstraint.activate([
            btnJugar.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 20),
            btnJugar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            btnAyuda.topAnchor.constraint(equalTo: btnJugar.bottomAnchor, constant: 350),
            btnAyuda.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc func irIzquierda() {
        let nuevoOffset = max(scrollView.contentOffset.x - scrollView.frame.width, 0)
        scrollView.setContentOffset(CGPoint(x: nuevoOffset, y: 0), animated: true)
    }

    @objc func irDerecha() {
        let maxOffset = scrollView.contentSize.width - scrollView.frame.width
        let nuevoOffset = min(scrollView.contentOffset.x + scrollView.frame.width, maxOffset)
        scrollView.setContentOffset(CGPoint(x: nuevoOffset, y: 0), animated: true)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pagina = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = pagina
        actualizarBotones()
    }

    func actualizarBotones() {
        let offset = scrollView.contentOffset.x
        let maxOffset = scrollView.contentSize.width - scrollView.frame.width
        
        btnIzquierda.isHidden = offset <= 0
        btnDerecha.isHidden = offset >= maxOffset
    }
    @objc func jugarTapped() {
        switch pageControl.currentPage {
        case 0:
            // Póker
            performSegue(withIdentifier: "goToPokerScreen", sender: self)
        case 1:
            // Tócame
            performSegue(withIdentifier: "goToTocameScreen", sender: self)
        default:
            break
        }
    }
    @objc func ayudaTapped() {
        var titulo = ""
        var mensaje = ""
        
        switch pageControl.currentPage {
        case 0:
            titulo = pokerTituloAlert
            mensaje = pokerReglas
        case 1:
            titulo = tocameTituloAlert
            mensaje = tocameReglas
        default:
            break
        }
        
        let alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alerta, animated: true, completion: nil)
        print("\(SesionUsuario.shared.userId),\(SesionUsuario.shared.accessToken)")

    }

}
