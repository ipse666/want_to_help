//
//  TabMenuViewController.swift
//  WantToHelp
//
//  Created by v.vaskin on 24/10/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import UIKit

protocol TabbarControllerDelegate: NSObjectProtocol {
    func selectButton(button: TabbarButton)
}

class TabMenuViewController: UITabBarController, RootTabBarDelegate  {

    var output: TabMenuViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: IBActions
    @IBAction func backArrowPressed(_ sender: Any) {
        exit(-1)
    }
    
    func addClick() {
        selectedIndex = TabbarButton.help.rawValue
        selectButton(button: .help)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        selectButton(button: TabbarButton(rawValue: item.tag)!)
    }
}

// MARK:- <TabMenuViewInput>
extension TabMenuViewController: TabMenuViewInput {
    func setupInitialState() {
        UIApplication.shared.statusBarStyle = .lightContent
        UINavigationBar.appearance().backgroundColor = .black
        UINavigationBar.appearance().barTintColor = UIColor(named: "leaf")
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "OfficinaSansExtraBoldSCC", size: 21) as Any, NSAttributedString.Key.foregroundColor:UIColor.white]
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().backgroundColor = .white
        let tab = RootTabBar()
        tab.addDelegate = self
        self.setValue(tab, forKey: "tabBar")
        self.selectedIndex = TabbarButton.help.rawValue
    }
}

extension TabMenuViewController: TabbarControllerDelegate {
    func selectButton(button: TabbarButton) {
        switch button {
        case .news:
            title = Constants.ui.pageTitles.news
        case .search:
            title = Constants.ui.pageTitles.search
        case .help:
            title = Constants.ui.pageTitles.help
        case .history:
            title = Constants.ui.pageTitles.history
        case .profile:
            title = Constants.ui.pageTitles.profile
        }
    }
}
