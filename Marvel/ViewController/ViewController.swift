//
//  ViewController.swift
//  Marvel
//
//  Created by iOSLab on 13/07/24.
//

import UIKit

class ViewController: UIViewController {
    
    let apiNetwork = APINetwork()
    var lastIndex: Int?
    var heroes: [Hero] = []
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    func getApiHero(firstCall: Bool = true) {
        apiNetwork.getHeroes { heroes in
            DispatchQueue.main.async {
                if firstCall {
                    self.heroes = heroes
                    self.loader.stopAnimating()
                } else {
                    self.heroes += heroes
                }
                self.tableView.reloadData()
            }
        } onError: { error in
            DispatchQueue.main.async {
                self.loader.stopAnimating()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        getApiHero()
    }


}
