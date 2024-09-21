//
//  DetailViewController.swift
//  Marvel
//
//  Created by iOSLab on 20/07/24.
//

import UIKit

class DetailViewController: UIViewController{
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroDescription: UITextView!
    
    
    var delegate: DetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let hero = delegate?.getHero() else {
            return
        }
        heroName.text = hero.name
        if let image = hero.imageData {
            heroImage.image = UIImage(data: image)
        }
        heroDescription.text = hero.description
    }
}
