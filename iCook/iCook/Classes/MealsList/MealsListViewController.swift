//
//  MealsListViewController.swift
//  iCook
//
//  Created by Rada Hristova on 18.11.21.
//

import UIKit

class MealsListViewController: ICViewController {
    
    //MARK: Properties
    private let category: String
    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Variables
    private var mealList: [MealListModel]? {
        didSet{
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    required init?(coder: NSCoder) {
        category = ""
        super.init(coder: coder)
    }
    
    init(category: String){
        self.category = category
        super.init(nibName: String(describing: MealsListViewController.self), bundle: nil)
    }
    
    //MARK: Life Cycle
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
        HTTPManager.sharedInstance.getMeals(by: category, delegate: self)
    }
    
}

//MARK: - TableView Extension
extension MealsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MealListTableViewCell.CELL_IDENTIFIER, for: indexPath) as! MealListTableViewCell
        if let meal = mealList?[indexPath.row]{
            cell.populate(withMeal: meal)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let meal = mealList?[indexPath.row] {
            let mealDetailsVC = MealDetailsViewController(with: meal)
            navigationController?.pushViewController(mealDetailsVC, animated: true)
        }
    }
}


extension MealsListViewController: HTTPManagerDelegate {
    func didGetResponse(model: BaseAPIObject) {
        if let mealList = model as? MealListModelResponse {
            self.mealList = mealList.mealList
        }
    }
}
