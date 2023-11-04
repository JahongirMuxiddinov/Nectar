//
//  TabbarController.swift
//  lesson-54-Nectar
//
//  Created by JAHONGIR on 20/10/23.
//

import Foundation
import UIKit

class TabbarController: UITabBarController {
    override func viewDidLoad() {
        let home = HomePageVC(nibName: "HomePageVC", bundle: nil)
        let navHome = UINavigationController(rootViewController: home)
        home.title = "Shop"
        home.tabBarItem.image = UIImage(systemName: "house")
        
        let explore = ExploreVC(nibName: "ExploreVC", bundle: nil)
        let navExplore = UINavigationController(rootViewController: explore)
        explore.title = "Explore"
        explore.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        let cart = CartVC(nibName: "CartVC", bundle: nil)
        let navCart = UINavigationController(rootViewController: cart)
        cart.title = "Cart"
        cart.tabBarItem.image = UIImage(systemName: "basket")
        
        let favourite = FavouriteVC(nibName: "FavouriteVC", bundle: nil)
        let navFavourite = UINavigationController(rootViewController: favourite)
        favourite.title = "Favourite"
        favourite.tabBarItem.image = UIImage(systemName: "heart.fill")
        
        let account = AccountVC(nibName: "AccountVC", bundle: nil)
        let navAccount = UINavigationController(rootViewController: account)
        account.title = "Account"
        account.tabBarItem.image = UIImage(systemName: "person.fill")
        
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        
        self.setViewControllers([navHome, navExplore, navCart, navFavourite, navAccount], animated: true)
    }
}
