//
//  GoodPlaceCell.swift
//  GoodPlaces
//
//  Created by Дмитрий Папушин on 16.01.2021.
//

import UIKit

class GoodPlaceCell: UITableViewCell {
    
    let namelabel = ""
    
    static let reuseID = "GoodPlaceCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    private func configure() {
        accessoryType = .detailDisclosureButton
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
