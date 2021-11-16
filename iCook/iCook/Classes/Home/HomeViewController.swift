//
//  HomeViewController.swift
//  iCook
//
//  Created by Rada Hristova on 15.11.21.
//
import Foundation

import UIKit

class HomeViewController: ICViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var categories = Category.categories(dictionaries: categoriesArray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CategoriesTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CategoriesTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesTableViewCell", for: indexPath) as! CategoriesTableViewCell
    
        cell.cellCategoryTitle.text = "Test Cell"
        return cell
    }

}
