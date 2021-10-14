//
//  ViewController.swift
//  Aprendiendo-Servicios
//
//  Created by José Francisco Castillo Rodríguez on 13/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchService()
    }
    
    private func fetchService(){
        let endpointString = "https://www.mocky.io/v2/5e2674472f00002800a4f417"
        
        guard let endpoint = URL(string: endpointString) else{
            return
        }
        activityIndicator.startAnimating()
        
        URLSession.shared.dataTask(with: endpoint) { (data: Data?, _, error: Error?) in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
            if error != nil {
                print("Hubo un error")
                
                return
            }
            
            guard let dataFromService = data,
                  let dictionary = try? JSONSerialization.jsonObject(with: dataFromService, options: []) as? [String: Any] else {
                return
            }
            
            //Importante: Llamados a la UI se hacen en el main thread
            DispatchQueue.main.async {
                let isHappy = dictionary["isHappy"] as? Bool ?? false
                self.nameLabel.text = dictionary["user"] as? String
                self.status.text = isHappy ? "El Usuario es Feliz" : "El usuario no es feliz"
            }
            
            
        }.resume()
    }

}

