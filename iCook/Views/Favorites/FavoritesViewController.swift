//
//  FavoritesViewController.swift
//  iCook
//
//  Created by Rada Hristova on 24.11.21.
//

import UIKit


class FavoritesViewController: ICViewController {

    var manager: DataManaging?
    private var meals: [Meal]? {
        didSet {
            tableView.reloadData()
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
        tableView.backgroundColor = .icBackgroundColor
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        meals = manager?.savedMeals()
    }

}

//MARK: Extension UITableView
extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        meals?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MealListTableViewCell.CELL_IDENTIFIER, for: indexPath) as! MealListTableViewCell
        if let meal = meals?[indexPath.item] {
            cell.populate(withMeal: meal, isFavorite: true)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let meal = meals?[indexPath.item] {
            let mealDetailsVC = MealDetailsViewController(meal: meal, manager: manager)
            navigationController?.pushViewController(mealDetailsVC, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let mealID = meals?[indexPath.row].id else {
            return nil
        }
        
        let delete = UIContextualAction(style: .destructive, title: "Delete")
        { [weak self] action, view, completionHandler in
            self?.manager?.removeMeal(withID: mealID)
            self?.meals = self?.manager?.savedMeals()
            
            completionHandler(true)
        }
        delete.backgroundColor = .icAccentColor
        return UISwipeActionsConfiguration(actions: [delete])
    }
}

