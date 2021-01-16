//
//  CustomImageView.swift
//  GoodPlaces
//
//  Created by Дмитрий Папушин on 16.01.2021.
//

import UIKit

class CustomImageView: UIImageView {
    
    let placeholderImage = #imageLiteral(resourceName: "LaunchScreenImg").withRenderingMode(.alwaysOriginal)
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
