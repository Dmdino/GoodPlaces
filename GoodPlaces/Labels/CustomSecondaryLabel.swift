//
//  CustomSecondaryLabel.swift
//  GoodPlaces
//
//  Created by Дмитрий Папушин on 16.01.2021.
//

import UIKit

class CustomSecondaryLabel: UILabel {
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           configure()
       }
       
       init(fontSize: CGFloat) {
           super.init(frame: .zero)
        font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
           configure()
           
       }
       
       private func configure() {
           textColor = .secondaryLabel
           adjustsFontSizeToFitWidth = true
           minimumScaleFactor = 0.90
           lineBreakMode = .byTruncatingTail
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
}
