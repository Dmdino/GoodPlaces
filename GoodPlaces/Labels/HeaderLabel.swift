//
//  HeaderLabel.swift
//  GoodPlaces
//
//  Created by Дмитрий Папушин on 18.01.2021.
//

import UIKit

class HeaderLabel: UILabel {
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.insetBy(dx: 16, dy: 0))
    }
}
