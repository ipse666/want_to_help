//
//  TabMenuViewController.swift
//  WantToHelp
//
//  Created by v.vaskin on 24/10/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import UIKit

class TabMenuViewController: UIViewController {

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
        if let tabbarController = self.children.first as? TabbarController {
            let tb: TabbarController = tabbarController
            tb.selectedIndex = TabbarButton.help.rawValue
            tb.tabbarDelegate = self
            title = Constants.ui.pageTitles.help
        }
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
