//
//  NameCell.swift
//  GoodPlaces
//
//  Created by Дмитрий Папушин on 27.01.2021.
//

import UIKit

class NameCell: UITableViewCell, UITextFieldDelegate {
    
    let nameLabel = CustomTitleLabel()
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.keyboardType = .default
        tf.returnKeyType = .done
        tf.autocapitalizationType = .sentences // The sentense starts from capital letter
        tf.placeholder = "Enter text"
        return tf
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.isUserInteractionEnabled = true
        selectionStyle = .none
        
        self.textField.delegate = self // the way to tap on return button and hide keyboard
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, textField])
        stackView.axis = .vertical
        stackView.spacing = 1
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 0, left: 12, bottom: 0, right: 0))
        
    }
    
    // MARK: - The way to hide the Keyboard by hitting return or done
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
