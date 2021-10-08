//
//  ViewController.swift
//  TablasPractice
//
//  Created by José Francisco Castillo Rodríguez on 07/10/21.
//

import UIKit

class ViewController: UIViewController {
    //MARK; - Referencia de la tabla
    @IBOutlet weak var tableView: UITableView!
    
    /*
        Implemetar DataSource <- Interfaz
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //No olvidar!!
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "mi-celda")
        
        //Para implementar se utiliza delegate
        tableView.delegate = self
    }


}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("La celda numero #\(indexPath.row) fue seleccionada")
    }
}

extension ViewController: UITableViewDataSource{
    //1.numero de filas que tendra la tabla
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    // 2.- metodo para saber que celdas deben mostrarse.
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mi-celda", for: indexPath)
        
        cell.textLabel?.text = "Soy la celda #\(indexPath.row)"
        
        return cell
    }
}
