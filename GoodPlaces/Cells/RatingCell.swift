//
//  RatingCell.swift
//  GoodPlaces
//
//  Created by Дмитрий Папушин on 31.01.2021.
//

import UIKit

class RatingCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .blue
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}
