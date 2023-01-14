//
//  TabletsViewController.swift
//  iMedical
//
//  Created by Никита Данилович on 06.01.2023.
//
import Foundation
import UIKit
import FirebaseFirestore
import SwiftUI



class TabletsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    private var medicaments:[Medicament] = []
    
    @IBOutlet weak var tabletsView: UITableView!
    
    private let  loadingIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        
        setupLoadingIndicator()
        
        initializeBackgroundView()
        
        initializeNavigationBar()
        
        initializeTableView()
        
    }
   
    
    func initializeBackgroundView(){
        
        let gradient = self.setGradient()
        view.layer.insertSublayer(gradient, at: 0)
        view.addSubview(tabletsView)
        
    }
    
    func setupLoadingIndicator(){
        
        loadingIndicator.frame = view.bounds
        loadingIndicator.style = .large
        loadingIndicator.color = UIColor(displayP3Red: 0.353, green: 0.757, blue: 0.816, alpha: 1.0)
        
    }
    func showLoadingIndicator(){
        
        view.addSubview(loadingIndicator)
        loadingIndicator.startAnimating()
        loadingIndicator.isHidden = false
        
    }
    func hideLoadingIndicator(){
    
        loadingIndicator.stopAnimating()
        loadingIndicator.isHidden = true
        loadingIndicator.removeFromSuperview()
        
    }
    func initializeTableView(){
        // show indicator, while table didn't receive data from Firebase
        showLoadingIndicator()
        
        tabletsView.dataSource = self
        tabletsView.delegate = self
        tabletsView.backgroundColor = .clear
        tabletsView.register(UINib(nibName: "TabletsCell", bundle: nil), forCellReuseIdentifier: "tabletsCell")
        
        loadingIndicator.startAnimating()
        
        let medicamentViewModel = MedicamentViewModel()
        
        medicamentViewModel.getMedicaments { drugs in
            
            for drug in drugs!{
                self.medicaments.append(drug)
            }
            
            self.tabletsView.reloadData()
            self.hideLoadingIndicator()
            
        }
        
    }
    
    func initializeNavigationBar(){
        
        navigationItem.title = "MEDICAMENTS"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor:UIColor(displayP3Red: 0.353, green: 0.757, blue: 0.816, alpha: 0.8),
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 20)
        ]
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.medicaments.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let medicament = medicaments[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "tabletsCell", for: indexPath) as! TabletsCellView
        
        cell.initalizeCell(medicament: medicament)
        
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
   
}
