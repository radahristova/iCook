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
       
        //Adding Subview to the cell
        let lineView = UIView(frame: CGRect(x: 10, y: cell.frame.size.height - 3, width: tableView.frame.size.width - 2 * 10 , height: 3.0))
        lineView.backgroundColor = .icDarkColor

        cell.addSubview(lineView)

        return cell
    }
    
   
    
}
