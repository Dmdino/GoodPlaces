//
//  MainVC.swift
//  GoodPlaces
//
//  Created by Дмитрий Папушин on 16.01.2021.
//

import UIKit

let reuseid = "cell"

class MainVC: UIViewController {
    
    // MARK: - Preferences
    
    let places = Place.getPlaces()
    
    let tabelView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabeleView()
        configureUI()
    }
    
    // MARK: - Creating table view
    
    func configureTabeleView() {
        view.addSubview(tabelView)
        
        tabelView.frame = view.bounds
        tabelView.rowHeight = 85
        tabelView.delegate = self
        tabelView.dataSource = self
        tabelView.separatorStyle = .none
        
        tabelView.register(GoodPlaceCell.self, forCellReuseIdentifier: GoodPlaceCell.reuseID)
        
    }
    
    private func configureUI() {
    
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Good Places"
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
        navigationItem.rightBarButtonItem?.tintColor = .systemPurple
    }
    
    @objc func addButtonTapped() {
        
        let destVC = AddPlaceController()
        let navcontroller = UINavigationController(rootViewController: destVC)
        present(navcontroller, animated: true, completion: nil)
        //navigationController?.pushViewController(destVC, animated: true)
                
        print("Try to show addPlaceController ")
    }

}

// MARK: - Tabeview Extension

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GoodPlaceCell.reuseID, for: indexPath) as! GoodPlaceCell
        
        let place = places[indexPath.row]
        
        cell.setProperties(places: place)
        
        return cell
    }
    
    
}
