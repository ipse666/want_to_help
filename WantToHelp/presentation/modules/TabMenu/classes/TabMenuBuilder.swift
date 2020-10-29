//
//  TabMenuBuilder.swift
//  WantToHelp
//
//  Created by v.vaskin on 24/10/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import UIKit

class TabMenuBuilder {

    func configure() -> UIViewController {
        let viewController = R.storyboard.tabMenu.instantiateInitialViewController()!

        let router = TabMenuRouter()
        router.transitionHandler = viewController

        let presenter = TabMenuPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = TabMenuInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        return viewController
    }

}
