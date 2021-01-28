//
//  GoodPlaceCell.swift
//  GoodPlaces
//
//  Created by Дмитрий Папушин on 16.01.2021.
//

import UIKit

class GoodPlaceCell: UITableViewCell {
    
    let placeImage = CustomEmptyView(frame: .zero)
    let nameLabel = CustomTitleLabel(textAligment: .left, fontSize: 20)
    let bodyLabel = CustomBodyTitleLabel(textAligment: .left)
    let secondryLabel = CustomSecondaryLabel(fontSize: 14)
    
    static let reuseID = "GoodPlaceCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    func setProperties(places: Place) {
        
        nameLabel.text = places.name
        bodyLabel.text = places.location
        secondryLabel.text = places.type
        placeImage.image = UIImage(named: places.name ?? "")
        
    }
    
    private func configure() {
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, bodyLabel, secondryLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
    
        addSubview(placeImage)
        addSubview(stackView)
        
        placeImage.layer.cornerRadius = 10
        
        accessoryType = .detailDisclosureButton
        selectionStyle = .none
        tintColor = .systemPurple
        
        placeImage.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 12, bottom: 0, right: 0), size: .init(width: 60, height: 60))
        placeImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        stackView.anchor(top: topAnchor, leading: placeImage.trailingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 5, left: 12, bottom: 5, right: 0), size: .init(width: 0, height: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
