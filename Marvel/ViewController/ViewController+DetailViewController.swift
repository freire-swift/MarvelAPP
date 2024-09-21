//
//  ViewController+DetailViewController.swift
//  Marvel
//
//  Created by iOSLab on 27/07/24.
//

import UIKit

extension ViewController: DetailViewControllerDelegate{
    func getHero() -> Hero? {
        guard let lastIndex else {
            return nil
        }
        return heroes[lastIndex]
    }
}
