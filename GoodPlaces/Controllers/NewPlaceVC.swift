//
//  NewPlaceVC.swift
//  GoodPlaces
//
//  Created by Дмитрий Папушин on 27.01.2021.
//

import UIKit

class NewPlaceVC: UITableViewController, UITextFieldDelegate {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()

    }
    // MARK: - Handlers
    @objc private func handleDone() {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @objc private func handleSave() {
        
        print("Try to save new place")
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 300
        } else if indexPath.row == 4 {
            return 200
        } else {
            return 80
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let header = ImageViewCell()
            return header
        } else if indexPath.row == 4 {
            let footer = UITableViewCell()
            return footer
        }
        
        let cell = NameCell(style: .default, reuseIdentifier: nil)
        
        switch indexPath.row {
        case 1:
            cell.nameLabel.text = "Name"
        case 2:
            cell.nameLabel.text = "Location"
        default:
            cell.nameLabel.text = "Type"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            print("Tap on Image")
        }
        view.endEditing(true)
    }
    
    // MARK: - Configure UI

    private func configureUI() {
        
        tableView.keyboardDismissMode = .interactive
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Add new Place"
        
        let cancelButon = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleDone))
        navigationItem.rightBarButtonItem = cancelButon
        
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(handleSave))
        navigationItem.leftBarButtonItem = saveButton
        navigationItem.leftBarButtonItem?.tintColor = .systemPurple
    }

}

//    func createDissmissKeyboard() {
//        let tap = UITapGestureRecognizer(target: self.tableView, action: #selector(UIView.endEditing(_:)))
//        view.addGestureRecognizer(tap)
//    }
