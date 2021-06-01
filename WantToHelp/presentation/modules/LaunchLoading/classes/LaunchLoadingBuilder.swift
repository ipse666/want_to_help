//
//  LaunchLoadingBuilder.swift
//  WantToHelp
//
//  Created by v.vaskin on 24/10/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import UIKit

class LaunchLoadingBuilder {

    func configure(viewController: LaunchLoadingViewController) {
        let router = LaunchLoadingRouter()
        router.transitionHandler = viewController

        let presenter = LaunchLoadingPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = LaunchLoadingInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }
    
}
