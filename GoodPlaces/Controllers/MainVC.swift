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
    
    let restaurantNames = ["Шок", "Бочка", "Балкан Гриль", "Классик"]
    
    let tabelView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabeleView()
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
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Good Places"
    }

}

// MARK: - Tabeview Extension

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GoodPlaceCell.reuseID, for: indexPath) as! GoodPlaceCell
        
        cell.textLabel?.text = restaurantNames[indexPath.row]
        cell.imageView?.image = UIImage(named: restaurantNames[indexPath.row])
        cell.imageView?.layer.cornerRadius = cell.frame.height / 2
        cell.imageView?.clipsToBounds = true
        
        return cell
    }
    
    
}
