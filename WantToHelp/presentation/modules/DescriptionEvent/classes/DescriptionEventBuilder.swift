//
//  DescriptionEventBuilder.swift
//  WantToHelp
//
//  Created by v.vaskin on 04/11/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import UIKit

class DescriptionEventBuilder {

    func configure(event: CharityEventItem) -> UIViewController {
        let nav = UIStoryboard.init(name: "DescriptionEvent", bundle: nil).instantiateInitialViewController() as! UINavigationController
        let viewController = nav.viewControllers.first as! DescriptionEventViewController
        viewController.title = event.head

        let router = DescriptionEventRouter()
        router.transitionHandler = viewController

        let presenter = DescriptionEventPresenter(charityEventItem: event)
        presenter.view = viewController
        presenter.router = router

        let interactor = DescriptionEventInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        return nav
    }

}
