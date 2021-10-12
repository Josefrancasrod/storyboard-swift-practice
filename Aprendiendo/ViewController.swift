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
    @IBOutlet weak var emailSwitch: UISwitch!
    
    @IBAction func loginButtonAction() {
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if email == "jose@gmail.com", password == "123"{
            if emailSwitch.isOn {
                //se guarda valores con llave y valor en los userdefaults
                storage.set(email, forKey: emailKey)
            }else{
                storage.removeObject(forKey: emailKey)
            }
            performSegue(withIdentifier: "home_segue", sender: nil)
        }else{
            print("Credenciales incorrectas")
        }
    }
    
    private let emailKey = "email-key"
    private let storage = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Se busca un string en los UserDefaults y lo asignamos.
        if let storedEmail = storage .string(forKey: emailKey) {
            emailTextField.text = storedEmail
            emailSwitch.isOn = true
        }else{
            
            emailSwitch.isOn = false
        }
    }


}

