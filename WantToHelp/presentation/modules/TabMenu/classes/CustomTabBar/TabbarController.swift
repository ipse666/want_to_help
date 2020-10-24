//
//  TabbarController.swift
//  WantToHelp
//
//  Created by Vladimir Vaskin on 24.10.2020.
//

import UIKit

protocol TabbarControllerDelegate: NSObjectProtocol {
    func selectButton(button: TabbarButton)
}

class TabbarController: UITabBarController, RootTabBarDelegate {

    weak var tabbarDelegate: TabbarControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tab = RootTabBar()
        tab.addDelegate = self
        self.setValue(tab, forKey: "tabBar")
    }
    
    func addClick() {
        selectedIndex = TabbarButton.help.rawValue
        if tabbarDelegate != nil {
            tabbarDelegate?.selectButton(button: .help)
        }
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        tabbarDelegate?.selectButton(button: TabbarButton(rawValue: item.tag)!)
    }
}
