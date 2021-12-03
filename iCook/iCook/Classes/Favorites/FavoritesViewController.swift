//
//  FavoritesViewController.swift
//  iCook
//
//  Created by Rada Hristova on 24.11.21.
//

import UIKit


class FavoritesViewController: ICViewController {
    
    
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
        tableView.reloadData()
    }
    
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        StorageManager.sharedInstance.favoritesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MealListTableViewCell.CELL_IDENTIFIER, for: indexPath) as! MealListTableViewCell
        if let meal = StorageManager.sharedInstance.meal(at: indexPath.row) {
            cell.populate(withMeal: meal)
            cell.favoriteImage.isHidden = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let meal = StorageManager.sharedInstance.meal(at: indexPath.row) {
            let mealDetailsVC = MealDetailsViewController(with: meal)
            navigationController?.pushViewController(mealDetailsVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { action, view, completionHandler in
            StorageManager.sharedInstance.remove(fromFavoritesAt: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            completionHandler(true)
            
        }
        delete.backgroundColor = .icAccentColor
        return UISwipeActionsConfiguration(actions: [delete])
    }
}

