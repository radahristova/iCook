//
//  MealsListViewController.swift
//  iCook
//
//  Created by Rada Hristova on 18.11.21.
//

import UIKit

class MealsListViewController: ICViewController {
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: MealListTableViewCell.CELL_IDENTIFIER, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: MealListTableViewCell.CELL_IDENTIFIER)
        tableView.delegate = self
        tableView.dataSource = self
        
        // Divider Color set to clear
        tableView.separatorColor = .clear

        
    }

}

extension MealsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
