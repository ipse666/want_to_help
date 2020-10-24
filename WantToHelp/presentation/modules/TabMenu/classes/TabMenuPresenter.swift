//
//  TabMenuPresenter.swift
//  WantToHelp
//
//  Created by v.vaskin on 24/10/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

class TabMenuPresenter {

    weak var view: TabMenuViewInput!
    var interactor: TabMenuInteractorInput!
    var router: TabMenuRouterInput!

}

// MARK:- <TabMenuViewOutput>
extension TabMenuPresenter: TabMenuViewOutput {
    func viewIsReady() {
        view.setupInitialState()
    }

    func backPressed(animated: Bool) {
        router.close(animated: animated)
    }
}

// MARK:- <TabMenuInteractorOutput>
extension TabMenuPresenter: TabMenuInteractorOutput {

}
