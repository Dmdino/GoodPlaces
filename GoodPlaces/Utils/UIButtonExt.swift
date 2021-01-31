//
//  UIButtonExt.swift
//  GoodPlaces
//
//  Created by Дмитрий Папушин on 31.01.2021.
//

import UIKit

extension UIButton {
    
    class func createButton(selector: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "Photo").withRenderingMode(.alwaysOriginal), for: .normal)
        button.clipsToBounds = true
        button.imageView?.contentMode = .scaleAspectFill
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.addTarget(self, action: selector, for: .touchUpInside)
        return button
    }
    
}
