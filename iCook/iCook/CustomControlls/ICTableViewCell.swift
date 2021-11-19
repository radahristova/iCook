//
//  ICTableViewCell.swift
//  iCook
//
//  Created by Rada Hristova on 17.11.21.
//

import Foundation
import UIKit
import Kingfisher

class ICTableViewCell: UITableViewCell {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //Remove cell selection color
        selectionStyle = .none
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 25, bottom: 10, right: 25))
        contentView.backgroundColor = .white
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 10
        clipsToBounds = true
        layer.cornerRadius = 10
        backgroundColor = .clear
        layer.masksToBounds = true
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 7
        layer.shadowOffset = .zero
        
        //    addLineDivider()
        //    chevron()
    }
    
    //MARK: Private Methods
    private func addLineDivider() {
        let lineDivider = UIView()
      //  lineDivider.backgroundColor = .icDarkColor
        lineDivider.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(lineDivider)
        
        NSLayoutConstraint.activate([
            lineDivider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            lineDivider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            lineDivider.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            lineDivider.heightAnchor.constraint(equalToConstant: 1.5)
        ])
        
    }
    
    private func chevron() {
        let chevronImage = UIImageView(image: UIImage(systemName: "chevron.compact.right"))
   //     chevronImage.tintColor = .icDarkColor
        chevronImage.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(chevronImage)
        
        NSLayoutConstraint.activate([
            chevronImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
            chevronImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            chevronImage.heightAnchor.constraint(equalToConstant: 13),
            chevronImage.widthAnchor.constraint(equalToConstant: 13)
        ])
        
    }
    
}
