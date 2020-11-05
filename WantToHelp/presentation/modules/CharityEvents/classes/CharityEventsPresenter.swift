//
//  CharityEventsPresenter.swift
//  WantToHelp
//
//  Created by v.vaskin on 02/11/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

class CharityEventsPresenter {

    weak var view: CharityEventsViewInput!
    var interactor: CharityEventsInteractorInput!
    var router: CharityEventsRouterInput!
    private var category: String
    
    init(category: String) {
        self.category = category
    }
}

// MARK:- <CharityEventsViewOutput>
extension CharityEventsPresenter: CharityEventsViewOutput {
    func viewIsReady() {
        view.setupInitialState()
        interactor.charity(category: category)
    }

    func backPressed(animated: Bool) {
        router.close(animated: animated)
    }
    
    func openDescription(charity: CharityEventItem) {
        router.openDescription(charity: charity)
    }
}

// MARK:- <CharityEventsInteractorOutput>
extension CharityEventsPresenter: CharityEventsInteractorOutput {
    func charity(charity: [CharityEventItem]) {
        view.updateСharity(charity: charity)
    }
}
