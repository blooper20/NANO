//
//  CustomTabBarController.swift
//  NANO
//
//  Created by DwaeWoo on 2024/03/05.
//

import UIKit
import SnapKit

final class CustomTabBarController: UITabBarController {
    
    //MARK: - Declaration
    let searchVC = SearchViewController()
    let mySongsVC = MySongsViewController()
    let releaseVC = ReleaseViewController()
    
    //MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        setTabBar()
    }
}

extension CustomTabBarController {
    
    //MARK: - Function
    private func configureTapBarItem(tab: UIViewController, title: String, image: String, tag: Int) {
        tab.title = title
        let emojiConfig = UIImage.SymbolConfiguration(pointSize: 15, weight: .bold, scale: .medium)
        tab.tabBarItem.image = UIImage(systemName: image, withConfiguration: emojiConfig)
        tab.tabBarItem.tag = tag
       }
    
    private func setTabBar() {
        tabBar.tintColor = .main
        
        configureTapBarItem(tab: searchVC, title: "검색", image: "magnifyingglass", tag: 0)
        configureTapBarItem(tab: mySongsVC, title: "보관함", image: "music.note.house.fill", tag: 1)
        configureTapBarItem(tab: releaseVC, title: "신곡", image: "sparkles", tag: 2)
        
        self.setViewControllers([searchVC, mySongsVC, releaseVC], animated: true)
    }
}

extension CustomTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        self.navigationItem.title = viewController.navigationItem.title
        self.navigationItem.rightBarButtonItems = viewController.navigationItem.rightBarButtonItems
    }
}
