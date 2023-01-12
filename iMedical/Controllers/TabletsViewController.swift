//
//  TabletsViewController.swift
//  iMedical
//
//  Created by Никита Данилович on 06.01.2023.
//
import Foundation
import UIKit


class TabletsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tablets: UILabel!
    
    @IBOutlet weak var tabletsView: UITableView!
    
    override func viewDidLoad() {
        
        installBackgroundView()
        initializeNavigationBar()
        initializeTableView()
        
    }
    
    func installBackgroundView(){
        
        let gradient = self.setGradient()
        view.layer.insertSublayer(gradient, at: 0)
        view.addSubview(tabletsView)
        
    }
    
    func initializeTableView(){
        
        tabletsView.dataSource = self
        tabletsView.delegate = self
        tabletsView.backgroundColor = .none
        tabletsView.register(UINib(nibName: "TabletsCell", bundle: nil), forCellReuseIdentifier: "tabletsCell")
        
    }
    
    func initializeNavigationBar(){
        
        navigationItem.title = "MEDICAMENTS"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor:UIColor(displayP3Red: 0.353, green: 0.757, blue: 0.816, alpha: 0.8),
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 20)
        ]
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tabletsCell", for: indexPath) as! TabletsCell
            cell.imageMedicament.image = UIImage()
            cell.titleMedicament.text = "Spazmalgon"
            cell.typeMedicament.text = "Tablet"
            cell.price.text = "250"
       return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.backgroundColor = .clear
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let rowLayer = CALayer()
        rowLayer.frame = cell.bounds
        rowLayer.backgroundColor = UIColor(red: 48.0 / 255.0, green: 43.0 / 255.0, blue: 77.0 / 255.0, alpha: 1.0).cgColor
        rowLayer.cornerRadius = 10
        cell.layer.insertSublayer(rowLayer, at: 0)
        
    }
  
   
}
