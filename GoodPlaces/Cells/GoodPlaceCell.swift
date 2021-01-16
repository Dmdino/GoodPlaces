//
//  GoodPlaceCell.swift
//  GoodPlaces
//
//  Created by Дмитрий Папушин on 16.01.2021.
//

import UIKit

class GoodPlaceCell: UITableViewCell {
    
    let placeImage = CustomImageView(frame: .zero)
    let nameLabel = CustomTitleLabel(textAligment: .left, fontSize: 20)
    let bodyLabel = CustomBodyTitleLabel(textAligment: .left)
    let secondryLabel = CustomSecondaryLabel(fontSize: 14)
    
    static let reuseID = "GoodPlaceCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    private func configure() {
        
        addSubview(placeImage)
        addSubview(nameLabel)
        addSubview(bodyLabel)
        addSubview(secondryLabel)
        
        nameLabel.text = "Name"
        bodyLabel.text = "Location"
        secondryLabel.text = "Type:"
        
        accessoryType = .detailDisclosureButton
        selectionStyle = .none
        
        placeImage.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 12, bottom: 0, right: 0), size: .init(width: 60, height: 60))
        placeImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        nameLabel.anchor(top: topAnchor, leading: placeImage.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 12, bottom: 0, right: 0), size: .init(width: 0, height: 40))
        
        bodyLabel.anchor(top: nameLabel.bottomAnchor, leading: placeImage.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 12, bottom: 0, right: 0), size: .init(width: 0, height: 20))
        
        secondryLabel.anchor(top: bodyLabel.bottomAnchor, leading: placeImage.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 12, bottom: 0, right: 0), size: .init(width: 0, height: 20))
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
