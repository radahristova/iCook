//
//  HomeViewController.swift
//  iCook
//
//  Created by Rada Hristova on 15.11.21.
//
import Foundation

import UIKit

class HomeViewController: ICViewController {
    
    var manager: DataManaging?

    @IBOutlet weak var tableView: UITableView!

    private var categories: [Category]? {
        didSet{
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Categories"
        
        let nib = UINib(nibName: CategoriesTableViewCell.CELL_IDENTIFIER, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CategoriesTableViewCell.CELL_IDENTIFIER)
        tableView.delegate = self
        tableView.dataSource = self

        // Divider Color set to clear
        tableView.separatorColor = .clear
        tableView.backgroundColor = .icBackgroundColor

        manager?.get { [weak self] in self?.categories = $0 }
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
        guard let category = categories?[indexPath.row].name else {
            return
        }
        let mealsViewController = MealsListViewController(category: category, manager: manager)
        navigationController?.pushViewController(mealsViewController, animated: true)
    }

}
