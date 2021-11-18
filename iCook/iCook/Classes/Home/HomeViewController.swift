//
//  HomeViewController.swift
//  iCook
//
//  Created by Rada Hristova on 15.11.21.
//
import Foundation

import UIKit

class HomeViewController: ICViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var categories = CategoryModel.categories(dictionaries: categoriesArray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: CategoriesTableViewCell.CELL_IDENTIFIER, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CategoriesTableViewCell.CELL_IDENTIFIER)
        tableView.delegate = self
        tableView.dataSource = self
        
        // Divider Color set to clear
        tableView.separatorColor = .clear
        HTTPManager.sharedInstance.getCategories()
        
    }
    
}

//MARK: - TableView Extension
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesTableViewCell.CELL_IDENTIFIER, for: indexPath) as! CategoriesTableViewCell
        cell.populate(withCategory: categories[indexPath.row])
        return cell
    }
    
   
    
}
