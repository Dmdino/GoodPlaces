//
//  AddNewPlaceController.swift
//  GoodPlaces
//
//  Created by Дмитрий Папушин on 31.01.2021.
//

import UIKit

class AddNewPlaceController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Properties
    
    lazy var imageButton = createButton(selector: #selector(handleSelectPhoto)) // look at extention
    lazy var image2 = createButton(selector: #selector(handleSelectPhoto))
    
    // MARK: - Selectors
    
    @objc func handleSelectPhoto(button: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc private func handleDone() { dismiss(animated: true, completion: nil) }
    @objc private func handleSave() { print("Try to save new place") }
    
    // MARK: - Image Picker Controller
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let selectedImage = info[.originalImage] as? UIImage
        imageButton.setImage(selectedImage?.withRenderingMode(.alwaysOriginal), for: .normal)
        dismiss(animated: true, completion: nil)
    }
    
    func createButton(selector: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "Photo").withRenderingMode(.alwaysOriginal), for: .normal)
        button.clipsToBounds = true
        button.imageView?.contentMode = .scaleAspectFill
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.addTarget(self, action: selector, for: .touchUpInside)
        return button
    }

    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItems()
        tableView.separatorStyle = .none
        tableView.keyboardDismissMode = .interactive
        createDissmissKeyboard()

    }
    
    // MARK: - Keyboard dismiss
    
    func createDissmissKeyboard() {
        let tap = UITapGestureRecognizer(target: self.tableView, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
    
    // MARK: - Tableview functions
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        if section == 0 {
            let header = UIView()

            header.addSubview(imageButton)
            imageButton.fillSuperview()
            
            header.addSubview(image2)
            image2.anchor(top: nil, leading: nil, bottom: header.bottomAnchor, trailing: header.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 10, right: 10), size: .init(width: 60, height: 60))

            return header
        }
        
        let headerLabel = HeaderLabel()
        headerLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        headerLabel.textColor = .systemPurple
        
        switch section {
        case 1:
            headerLabel.text = "Name"
        case 2:
            headerLabel.text = "Address"
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
            let ratingCell = RatingCell(style: .default, reuseIdentifier: nil)
            return ratingCell
        }
        
        let cell = SettingsCell(style: .default, reuseIdentifier: nil)
        
        return cell
    }
    
    // MARK: - Setup layout
    
    fileprivate func setupNavigationItems() {
        
        navigationItem.title = "Add new Place"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let cancelButon = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleDone))
        navigationItem.rightBarButtonItem = cancelButon
        
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(handleSave))
        navigationItem.leftBarButtonItem = saveButton
        navigationItem.leftBarButtonItem?.tintColor = .systemPurple
    }


}
