//
//  ViewController.swift
//  Aprendiendo
//
//  Created by José Francisco Castillo Rodríguez on 28/09/21.
//

import UIKit
import PopupDialog


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
            showErrorDialog()
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
    
    private func showErrorDialog(){
        let title = "Error"
        let message = "Credenciales Invalidas"
        let image = UIImage(named: "pexels-photo-103290")

        // Create the dialog
        let popup = PopupDialog(title: title, message: message, image: image)

        // Create buttons
        let buttonOne = CancelButton(title: "CANCEL") {
            print("You canceled the car dialog.")
        }

        // Add buttons to dialog
        // Alternatively, you can use popup.addButton(buttonOne)
        // to add a single button
        popup.addButtons([buttonOne])

        // Present dialog
        self.present(popup, animated: true, completion: nil)
    }


}

