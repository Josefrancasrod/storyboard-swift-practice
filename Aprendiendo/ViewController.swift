//
//  ViewController.swift
//  Aprendiendo
//
//  Created by José Francisco Castillo Rodríguez on 28/09/21.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Reference  UI
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButtonAction() {
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if email == "jose@gmail.com", password == "123"{
            print("Bienvenido")
            performSegue(withIdentifier: "home_segue", sender: nil)
        }else{
            print("Credenciales incorrectas")
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

