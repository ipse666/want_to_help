//
//  LaunchLoadingRouter.swift
//  WantToHelp
//
//  Created by v.vaskin on 24/10/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import UIKit

class LaunchLoadingRouter: LaunchLoadingRouterInput {
	weak var transitionHandler: UIViewController!

    func openHelpCatigories() {
        let vc = TabMenuBuilder().configure()
        vc.modalPresentationStyle = .fullScreen
        transitionHandler.present(vc, animated: false, completion: nil)
    }
}
