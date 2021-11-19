//
//  HomeViewController.swift
//  iCook
//
//  Created by Rada Hristova on 15.11.21.
//
import Foundation

import UIKit

class HomeViewController: ICViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Variables
    private var categories: [CategoryModel]? {
        didSet{
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: CategoriesTableViewCell.CELL_IDENTIFIER, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CategoriesTableViewCell.CELL_IDENTIFIER)
        tableView.delegate = self
        tableView.dataSource = self
        
        // Divider Color set to clear
        tableView.separatorColor = .clear
        
        navigationItem.title = "Categories"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        HTTPManager.sharedInstance.getCategoriesRequest(delegate: self)
    }
    
}

//MARK: - TableView Extension
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesTableViewCell.CELL_IDENTIFIER, for: indexPath) as! CategoriesTableViewCell
        if let category = categories?[indexPath.row] {
            cell.populate(withCategory: category)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let category = categories?[indexPath.row].strCategory else {
            return
        }
        let mealsViewController = MealsListViewController(category: category)
        navigationController?.pushViewController(mealsViewController, animated: true)
    }
    
}

//MARK: HTTPManagerDelegate Extension
extension HomeViewController: HTTPManagerDelegate {
    
    func didGetResponse(model: BaseAPIObject) {
        if let categories = model as? CategoryModelResponse {
            self.categories = categories.categories
        }
        
    }
    
}




