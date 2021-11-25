//
//  MealDetailsViewController.swift
//  iCook
//
//  Created by Rada Hristova on 22.11.21.
//

import UIKit
import AVFoundation
import PKHUD

class MealDetailsViewController: ICViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Dependencies
    private let httpManager: HTTPManager
    private var storageManager: StorageManaging
    private var hud: PKHUD
    
    //MARK: Variables
    private var meal: MealListModel!
    
    //MARK: Life Cycle
    init(with meal: MealListModel,
         httpManager: HTTPManager = HTTPManager.sharedInstance,
         storageManager: StorageManaging = StorageManager.shared,
         hud: PKHUD = PKHUD.sharedHUD) {
        self.meal = meal
        self.httpManager = httpManager
        self.storageManager = storageManager
        self.hud = hud
        super.init(nibName: "MealDetailsViewController", bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        self.httpManager = HTTPManager.sharedInstance
        self.storageManager = StorageManager.shared
        self.hud = PKHUD.sharedHUD
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = meal.strMeal
        
        let nib = UINib(nibName: MealDetailsImageTableViewCell.CELL_IDENTIFIER, bundle: nil)
        let nibTwo = UINib(nibName: MealDetailsInformationTableViewCell.CELL_IDENTIFIER, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: MealDetailsImageTableViewCell.CELL_IDENTIFIER)
        tableView.register(nibTwo, forCellReuseIdentifier: MealDetailsInformationTableViewCell.CELL_IDENTIFIER)
        tableView.delegate = self
        tableView.dataSource = self
        
        
        // Divider Color set to clear
        tableView.separatorColor = .clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if meal.details == nil, let mealId = meal.idMeal {
            httpManager.getMeal(byId: mealId, delegate: self)
        }
    }
    
    private func showDetails() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
            self?.addFavoriteButton()
        }
    }
    
    
    private func addFavoriteButton() {
        let wasAdded = storageManager.hasAddedAtIndex(toFavorites: meal.idMeal) != nil
        let image = UIImage(named: wasAdded ? "heart.fill" : "heart")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain , target: self, action: #selector(tappedFavorite))
    }
    
    @objc func tappedFavorite(_ barButtonItem: UIBarButtonItem) {
        guard let meal = meal else {
            return
        }
        if let index = storageManager.hasAddedAtIndex(toFavorites: meal.idMeal) {
            storageManager.remove(fromFavoritesAt: index)
            barButtonItem.image = UIImage(named: "heart")
        } else {
            if storageManager.hasAddedMaxFavorites {
               showMaximumAlert()
            } else {
                storageManager.add(toFavorites: meal) 
                barButtonItem.image = UIImage(named: "heart.fill")
                showSuccessAlert()
            }
        }
        
    }
    
    private func showMaximumAlert() {
        hud.contentView = PKHUDTextView(text: "You cannot add more than \(storageManager.maxFavorites) recipes!")
        hud.show()
        hud.hide(afterDelay: 3.0) { success in
            // Completion Handler
        }
    }
    
    private func showSuccessAlert() {
        hud.contentView = PKHUDSuccessView()
        hud.show()
        hud.hide(afterDelay: 1.0) { success in
            // Completion Handler
        }
    }
    
    private func getLabelHeight(text: String, font: UIFont, width: CGFloat) -> CGFloat {
        
        let label = ICLabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.configureDefault(withSize: 17)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
}


//MARK: Extension UITableView
extension MealDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: MealDetailsImageTableViewCell.CELL_IDENTIFIER, for: indexPath) as! MealDetailsImageTableViewCell
            cell.populate(withMeal: meal)
            return cell
        } else if indexPath.row == 1, let details = meal.details {
            let cell = tableView.dequeueReusableCell(withIdentifier: MealDetailsInformationTableViewCell.CELL_IDENTIFIER, for: indexPath) as! MealDetailsInformationTableViewCell
            cell.populate(withMeal: details)
            return cell
        }
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return MealDetailsImageTableViewCell.CELL_HEIGHT
        } else if indexPath.row == 1 {
            var actualSize = MealDetailsInformationTableViewCell.CELL_BASE_HEIGHT
            actualSize += getLabelHeight(text: meal.details?.strInstructions ?? "",
                                         font: UIFont(name: "Palatino", size: 19)!,
                                         width: UIScreen.main.bounds.width - 70)
            return actualSize
        }
        return 10
    }
    
}

//MARK: Extension HTTPManagerDelegate
extension MealDetailsViewController: HTTPManagerDelegate {
    func didGetResponse(model: BaseAPIObject) {
        if let mealResponse = model as? MealDetailsModelResponse {
            self.meal.details = mealResponse.mealDetails?.first
            showDetails()
        }
    }
}

