//
//  ViewController+UITableView.swift
//  Marvel
//
//  Created by iOSLab on 20/07/24.
//

import UIKit

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        lastIndex = indexPath.row
        let storyboard = UIStoryboard(name: Constants.storyboardName, bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: Constants.detailVCName)
        guard let detailVc = vc as? DetailViewController else {
            return
        }
        detailVc.delegate = self
        navigationController?.pushViewController(detailVc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.heroCellSize
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.heroCellName, for: indexPath)
        guard let heroCell = cell as? HeroTableViewCell else{
            return cell
        }
        let hero: Hero = heroes[indexPath.row]
        heroCell.delegate = self
        heroCell.setup(index: indexPath.row, hero: hero)
        
        let isLastIndex = indexPath.row == heroes.count - 16
        if isLastIndex {
            getApiHero(firstCall: false)
        }
        
        return heroCell
    }
    
    
}
