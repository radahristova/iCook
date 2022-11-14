//
//  MealsListViewController.swift
//  iCook
//
//  Created by Rada Hristova on 18.11.21.
//

import UIKit

class MealsListViewController: ICViewController {

    private let category: String
    private let manager: DataManaging?

    @IBOutlet weak var tableView: UITableView!

    private var meals: [Meal]? {
        didSet{
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }

    required init?(coder: NSCoder) {
        category = ""
        manager = nil
        super.init(coder: coder)
    }

    init(category: String, manager: DataManaging?) {
        self.category = category
        self.manager = manager
        super.init(nibName: String(describing: MealsListViewController.self), bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = category

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
        manager?.get(in: category) { [weak self] in self?.meals = $0 }
    }
}

//MARK: - TableView Extension
extension MealsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MealListTableViewCell.CELL_IDENTIFIER, for: indexPath) as! MealListTableViewCell
        if let meal = meals?[indexPath.row] {
            cell.populate(
                withMeal: meal,
                isFavorite: manager?.hasSavedMeal(withID: meal.id) ?? false
            )
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let meal = meals?[indexPath.row] {
            let mealDetailsVC = MealDetailsViewController(
                meal: meal,
                manager: manager
            )
            navigationController?.pushViewController(mealDetailsVC, animated: true)
        }
    }

}
