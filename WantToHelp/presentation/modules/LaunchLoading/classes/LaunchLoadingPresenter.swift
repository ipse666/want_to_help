//
//  LaunchLoadingPresenter.swift
//  WantToHelp
//
//  Created by v.vaskin on 24/10/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

class LaunchLoadingPresenter {

    weak var view: LaunchLoadingViewInput!
    var interactor: LaunchLoadingInteractorInput!
    var router: LaunchLoadingRouterInput!

}

// MARK:- <LaunchLoadingViewOutput>
extension LaunchLoadingPresenter: LaunchLoadingViewOutput {
    func viewIsReady() {
        // Что-то долго грузится в фоне
        Utils.runAfterDelay(2.0) {
            self.router.openHelpCatigories()
        }
    }

    func backPressed(animated: Bool) {
        router.close(animated: animated)
    }
}

// MARK:- <LaunchLoadingInteractorOutput>
extension LaunchLoadingPresenter: LaunchLoadingInteractorOutput {

}
