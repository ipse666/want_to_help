//
//  HelpCategoriesRouter.swift
//  WantToHelp
//
//  Created by v.vaskin on 24/10/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import UIKit

class HelpCategoriesRouter: HelpCategoriesRouterInput {
	weak var transitionHandler: UIViewController!

    func openCharity(helpItem: HelpItem) {
        let vc = CharityEventsBuilder().configure(category: helpItem.name)
        vc.title = helpItem.title
        transitionHandler.navigationController?.pushViewController(vc, animated: true)
    }
}
