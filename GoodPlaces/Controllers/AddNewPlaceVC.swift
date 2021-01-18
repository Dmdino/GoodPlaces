//
//  AddNewPlaceVC.swift
//  GoodPlaces
//
//  Created by Дмитрий Папушин on 18.01.2021.
//

import UIKit

let reuseID = "Cell"

class AddNewPlaceVC: UIViewController {
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        configureTabelView()
        configureUI()
    }
    
    private func configureTabelView() {
        
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView() // get rid of separetors
        tableView.keyboardDismissMode = .interactive
        
        //tableView.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.settingsCellReuseID)
        
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
}

extension AddNewPlaceVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = .systemPurple
        
        if section == 0 {
            return header
        }
        
        let headerLabel = HeaderLabel()
        headerLabel.text = "Name"
        return headerLabel
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 300
        }
        
        return 40
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 0 : 1 // What ? True : False or If section == 0 ?(return 0) :(esle return 1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SettingsCell(style: .default, reuseIdentifier: nil)

        return cell
    }
    
    
}
