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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiNetwork.getHeroes { heroes in
            DispatchQueue.main.async {
                self.heroes = heroes
                self.tableView.reloadData()
                self.loader.stopAnimating()
            }
        } onError: { error in
            DispatchQueue.main.async {
                self.loader.stopAnimating()
            }
        }

        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }


}
