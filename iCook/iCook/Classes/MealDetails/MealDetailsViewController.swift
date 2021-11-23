//
//  MealDetailsViewController.swift
//  iCook
//
//  Created by Rada Hristova on 22.11.21.
//

import UIKit
import AVFoundation

class MealDetailsViewController: ICViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Variables
    private var mealId: String?
    private var meal: MealDetailsModel? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
            self.title = meal?.strMeal
        }
    }
    
    //MARK: Life Cycle
    init(withMealId id: String) {
        self.mealId = id
        super.init(nibName: "MealDetailsViewController", bundle: nil)
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let nib = UINib(nibName: MealDetailsImageTableViewCell.CELL_IDENTIFIER, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: MealDetailsImageTableViewCell.CELL_IDENTIFIER)
        tableView.delegate = self
        tableView.dataSource = self
        
        // Divider Color set to clear
        tableView.separatorColor = .clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let mealId = mealId {
            HTTPManager.sharedInstance.getMeal(byId: mealId, delegate: self)
        }
    }
    
}

//MARK: Extension UITableView
extension MealDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MealDetailsImageTableViewCell.CELL_IDENTIFIER, for: indexPath) as! MealDetailsImageTableViewCell
        
        if let meal = meal {
            cell.populate(withMeal: meal)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return MealDetailsImageTableViewCell.CELL_HEIGHT
        }
        return 10
    }
    
}

//MARK: Extension HTTPManagerDelegate
extension MealDetailsViewController: HTTPManagerDelegate {
    func didGetResponse(model: BaseAPIObject) {
        if let mealResponse = model as? MealDetailsModelResponse {
            self.meal = mealResponse.mealDetails?.first
        }
    }
}

