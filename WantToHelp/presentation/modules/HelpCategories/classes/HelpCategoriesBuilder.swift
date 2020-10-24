//
//  HelpCategoriesBuilder.swift
//  WantToHelp
//
//  Created by v.vaskin on 24/10/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import UIKit

class HelpCategoriesBuilder {

    func configure(viewController: HelpCategoriesViewController) {
        let router = HelpCategoriesRouter()
        router.transitionHandler = viewController

        let presenter = HelpCategoriesPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = HelpCategoriesInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }
}
