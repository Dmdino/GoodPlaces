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
        tableView.tableFooterView = UIView() // get rid of separtor
        tableView.keyboardDismissMode = .interactive
        tableView.backgroundColor = UIColor(white: 0.97, alpha: 1)
        
        configureUI()
        createDissmissKeyboard()
     
    }
    
    func createDissmissKeyboard() {
        let tap = UITapGestureRecognizer(target: self.tableView, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
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
        
        let imageView = CustomEmptyView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        
        header.addSubview(imageView)
        
        imageView.anchor(top:header.topAnchor, leading: header.leadingAnchor, bottom: header.bottomAnchor, trailing: header.trailingAnchor, padding: .zero, size: .init(width: 0, height: 0))
        
        if section == 0 {
            return header
        }
        
        let headerLabel = HeaderLabel()
        switch section {
        case 1:
            headerLabel.text = "Name"
        case 2:
            headerLabel.text = "Adress"
        case 3:
            headerLabel.text = "Type"
        default :
            headerLabel.text = "Rate"
        
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
        
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return section == 0 ? 0 : 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 4 {
            let footer = UITableViewCell()
            footer.selectionStyle = .none
            footer.backgroundColor = .systemYellow
            return footer
        }
        
        let cell = SettingsCell(style: .default, reuseIdentifier: nil)
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 4 {
            return 200
        }
        
        return 60
    }

}
