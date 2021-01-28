//
//  ImageViewCell.swift
//  GoodPlaces
//
//  Created by Дмитрий Папушин on 28.01.2021.
//

import UIKit

class ImageViewCell: UITableViewCell {
    
    let placeholderImage: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Photo").withRenderingMode(.alwaysOriginal)
        iv.clipsToBounds = true
        iv.backgroundColor = .systemGray6
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(placeholderImage)
        placeholderImage.fillSuperview()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
