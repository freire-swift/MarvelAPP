//
//  ViewController + HeroTableViewCellDelegate.swift
//  Marvel
//
//  Created by Pedro Henrique Freire de Oliveira on 21/09/24.
//

import Foundation

extension ViewController: HeroTableViewCellDelegate {
    func saveImage(index: Int, image: Data) {
        heroes[index].imageData = image
    }
    
    
}
