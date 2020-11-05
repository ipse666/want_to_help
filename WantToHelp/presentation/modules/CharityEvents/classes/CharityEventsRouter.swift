//
//  CharityEventsRouter.swift
//  WantToHelp
//
//  Created by v.vaskin on 02/11/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import UIKit

class CharityEventsRouter: CharityEventsRouterInput {
	weak var transitionHandler: UIViewController!

    func openDescription(charity: CharityEventItem) {
        let vc = DescriptionEventBuilder().configure(event: charity)
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        transitionHandler.present(vc, animated: true, completion: nil)
    }
}
