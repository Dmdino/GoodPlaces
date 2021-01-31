//
//  SettingsCell.swift
//  GoodPlaces
//
//  Created by Дмитрий Папушин on 18.01.2021.
//

import UIKit

class SettingsCell: UITableViewCell, UITextFieldDelegate {
    
    class SettingsTextField: UITextField {
        
        override func textRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.insetBy(dx: 16, dy: 0)
        }
        
        override func editingRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.insetBy(dx: 16, dy: 0)
        }
        
        override var intrinsicContentSize: CGSize {
            return .init(width: 0, height: 44)
        }
    }
    
    let textField: UITextField = {
        let tf = SettingsTextField()
        tf.keyboardType = .default
        tf.returnKeyType = .done
        tf.autocapitalizationType = .sentences // The sentense starts from capital letter
        tf.placeholder = "Enter text"
        
        return tf
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.textField.delegate = self
        
        contentView.isUserInteractionEnabled = true
        
        addSubview(textField)
        textField.fillSuperview()
        
        //selectionStyle = .none
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
