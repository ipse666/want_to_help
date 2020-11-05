//
//  HelpCategoriesPresenter.swift
//  WantToHelp
//
//  Created by v.vaskin on 24/10/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

class HelpCategoriesPresenter {

    weak var view: HelpCategoriesViewInput!
    var interactor: HelpCategoriesInteractorInput!
    var router: HelpCategoriesRouterInput!
    var testModel: [HelpItem] = [HelpItem]()
}

// MARK:- <HelpCategoriesViewOutput>
extension HelpCategoriesPresenter: HelpCategoriesViewOutput {
    func viewIsReady() {
        view.setupInitialState()
        interactor.categories()
    }

    func backPressed(animated: Bool) {
        router.close(animated: animated)
    }
    
    func openCharity(helpItem: HelpItem) {
        router.openCharity(helpItem: helpItem)
    }
}

// MARK:- <HelpCategoriesInteractorOutput>
extension HelpCategoriesPresenter: HelpCategoriesInteractorOutput {
    func categories(categories: [HelpItem]) {
        view.updateCategories(categories: categories)
    }
}
