//
//  DrawerRootViewController.swift
//  Superhero
//
//  Created by Francis Adelante on 2/5/25.
//

import UIKit
import DrawerMenu

class DrawerRootViewController: BaseViewController {
    var drawer:DrawerMenu!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let left = SideMenuViewController()
        let center = MainViewController()
        let centerNav = UINavigationController(rootViewController: center)
        let leftNav = UINavigationController(rootViewController: left)
        drawer = DrawerMenu(center: centerNav, left: leftNav, right: nil)
        
        addChild(drawer)
        view.addSubview(drawer.view)
        drawer.didMove(toParent: self)
        drawer.panGestureType = .none
    }
    

}
