//
//  CustomEmptyView.swift
//  GoodPlaces
//
//  Created by Дмитрий Папушин on 18.01.2021.
//

import UIKit

class CustomEmptyView: UIImageView {

    let placeholderImage = #imageLiteral(resourceName: "Photo").withRenderingMode(.alwaysOriginal)
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        configure()
    }
    
    private func configure() {
        clipsToBounds = true
        image = placeholderImage
        backgroundColor = .lightGray
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
