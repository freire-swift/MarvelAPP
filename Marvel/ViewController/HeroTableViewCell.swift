//
//  HeroTableViewCell.swift
//  Marvel
//
//  Created by iOSLab on 20/07/24.
//

import UIKit

protocol HeroTableViewCellDelegate {
    func saveImage(index: Int, image: Data)
}

class HeroTableViewCell: UITableViewCell{
    
    let apiNetwork = APINetwork()
    var delegate: HeroTableViewCellDelegate?
    @IBOutlet weak var imageHero: UIImageView!
    @IBOutlet weak var nameHero: UILabel!
    
    func setup(index: Int, hero: Hero){
        nameHero.text = hero.name
        imageHero.image = .none
        
        if let image = hero.imageData{
            let image = UIImage(data: image)
            self.imageHero.image = image
        } else {
            apiNetwork.getData(path: hero.imageURL) {
                imageData in
                self.delegate?.saveImage(index: index, image: imageData)
                DispatchQueue.main.async {
                    let image = UIImage(data: imageData)
                    self.imageHero.image = image
                }
            } onError: { error in
                
            }
        }
    }
}
