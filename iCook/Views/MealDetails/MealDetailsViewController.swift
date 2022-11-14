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

    private let HEIGHT_CELL = CGFloat(10)

    @IBOutlet weak var tableView: UITableView!

    private let meal: Meal!
    private let manager: DataManaging?

    init(meal: Meal, manager: DataManaging?) {
        self.meal = meal; self.manager = manager
        super.init(nibName: "MealDetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.meal = nil; self.manager = nil
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = meal.name
        
        let nib = UINib(nibName: MealDetailsImageTableViewCell.CELL_IDENTIFIER, bundle: nil)
        let nibTwo = UINib(nibName: MealDetailsInformationTableViewCell.CELL_IDENTIFIER, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: MealDetailsImageTableViewCell.CELL_IDENTIFIER)
        tableView.register(nibTwo, forCellReuseIdentifier: MealDetailsInformationTableViewCell.CELL_IDENTIFIER)
        tableView.delegate = self
        tableView.dataSource = self

        tableView.separatorColor = .clear
        tableView.backgroundColor = .icBackgroundColor

        if meal.details == nil {
            manager?.get(of: meal.id, completion: { [weak self] in
                self?.meal.details = $0
                DispatchQueue.main.async { self?.tableView.reloadData() }
            })
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpFavoriteButton()
    }

    private func setUpFavoriteButton() {
        let wasAdded = manager?.savedMeals()?.contains(where: { $0.id == meal.id }) == true
        let image = UIImage(named: wasAdded ? "heart.fill" : "heart")
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: image, style: .plain , target: self,
            action: #selector(tappedFavorite)
        )
    }

    @objc func tappedFavorite(_ barButtonItem: UIBarButtonItem) {
        guard let meal = meal else {
            return
        }
        if manager?.hasSavedMeal(withID: meal.id) == true {
            manager?.removeMeal(withID: meal.id)
            barButtonItem.image = UIImage(named: "heart")
            showSuccessAlert()
        } else {
            manager?.save(meal: meal)
            barButtonItem.image = UIImage(named: "heart.fill")
            showSuccessAlert()
            hapticFeedBack()
        }
        
    }
    
    private func showSuccessAlert() {
        PKHUD.sharedHUD.contentView = PKHUDSuccessView()
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: 1.0) { success in
            // Completion Handler
        }
    }

    private func hapticFeedBack() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
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
            actualSize += getLabelHeight(text: meal.details?.instructions ?? "",
                                         font: UIFont(name: "Palatino", size: 19)!,
                                         width: UIScreen.main.bounds.width - 70)
            return actualSize
        }
        return HEIGHT_CELL
    }

}
