//
//  FavoritesViewController.swift
//  iCook
//
//  Created by Rada Hristova on 24.11.21.
//

import UIKit

class FavoritesViewController: ICViewController {
    
    var favorites: [MealListModel]? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Favorites"
        let nib = UINib(nibName: MealListTableViewCell.CELL_IDENTIFIER, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: MealListTableViewCell.CELL_IDENTIFIER)
        tableView.delegate = self
        tableView.dataSource = self
        
        // Divider Color set to clear
        tableView.separatorColor = .clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favorites = StorageManager.shared.favorites
    }

}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MealListTableViewCell.CELL_IDENTIFIER, for: indexPath) as! MealListTableViewCell
        if let meal = favorites?[indexPath.row]{
            cell.populate(withMeal: meal)
        }
        return cell
    }
    
    
}
