//
//  ICTableViewCell.swift
//  iCook
//
//  Created by Rada Hristova on 17.11.21.
//

import Foundation
import UIKit

class ICTableViewCell: UITableViewCell {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //Remove cell selection color
        selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addLineDivider()
    }
    
    //MARK: Private Methods
    private func addLineDivider() {
        let lineDivider = UIView()
        lineDivider.backgroundColor = .icDarkColor
        lineDivider.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(lineDivider)

        NSLayoutConstraint.activate([
            lineDivider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            lineDivider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            lineDivider.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            lineDivider.heightAnchor.constraint(equalToConstant: 1.5)
        ])

    }
    
}
