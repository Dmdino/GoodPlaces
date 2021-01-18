//
//  AddPlaceController.swift
//  GoodPlaces
//
//  Created by Дмитрий Папушин on 18.01.2021.
//

import UIKit

class AddPlaceController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        configureUI()
     
    }
    
    private func configureUI() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Add new Place"
        
        let cancelButon = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleDone))
        navigationItem.rightBarButtonItem = cancelButon
        //navigationItem.rightBarButtonItem?.tintColor = .systemPurple
        
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(handleSave))
        navigationItem.leftBarButtonItem = saveButton
        navigationItem.leftBarButtonItem?.tintColor = .systemPurple
    
    }
    
    @objc private func handleDone() {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @objc private func handleSave() {
        
        print("Try to save new place")
        
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = .systemBackground
        
        if section == 0 {
            return header
        }
        
        let headerLabel = HeaderLabel()
        switch section {
        case 1:
            headerLabel.text = "Name"
        case 2:
            headerLabel.text = "Adress"
        default:
            headerLabel.text = "Type"
        }
        return headerLabel
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 300
        }
        
        return 40
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return section == 0 ? 0 : 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SettingsCell(style: .default, reuseIdentifier: nil)
    
        return cell
    }

}
