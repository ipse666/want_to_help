//
//  DescriptionEventPresenter.swift
//  WantToHelp
//
//  Created by v.vaskin on 04/11/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

class DescriptionEventPresenter {
    weak var view: DescriptionEventViewInput!
    var interactor: DescriptionEventInteractorInput!
    var router: DescriptionEventRouterInput!
    private var charityEventItem: CharityEventItem
    
    init(charityEventItem: CharityEventItem) {
        self.charityEventItem = charityEventItem
    }
}

// MARK:- <DescriptionEventViewOutput>
extension DescriptionEventPresenter: DescriptionEventViewOutput {
    func viewIsReady() {
        view.setupInitialState(charityEventItem: charityEventItem)
    }

    func backPressed(animated: Bool) {
        router.close(animated: animated)
    }
}

// MARK:- <DescriptionEventInteractorOutput>
extension DescriptionEventPresenter: DescriptionEventInteractorOutput {

}
