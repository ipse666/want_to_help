//
//  CharityEventsBuilder.swift
//  WantToHelp
//
//  Created by v.vaskin on 02/11/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import UIKit

class CharityEventsBuilder {

    func configure(category: String) -> UIViewController {
        let viewController = UIStoryboard.init(name: "CharityEvents", bundle: nil).instantiateInitialViewController() as! CharityEventsViewController

        let router = CharityEventsRouter()
        router.transitionHandler = viewController

        let presenter = CharityEventsPresenter(category: category)
        presenter.view = viewController
        presenter.router = router

        let interactor = CharityEventsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        return viewController
    }

}
