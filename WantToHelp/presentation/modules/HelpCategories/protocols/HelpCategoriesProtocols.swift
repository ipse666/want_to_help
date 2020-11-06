//
//  HelpCategoriesProtocols.swift
//  WantToHelp
//
//  Created by v.vaskin on 24/10/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import Foundation

// MARK:- <View>
protocol HelpCategoriesViewInput: class {
    func setupInitialState()
    func updateCategories(categories: [HelpItem])
}

protocol HelpCategoriesViewOutput {
    func viewIsReady()
    func backPressed(animated: Bool)
    func openCharity(helpItem: HelpItem)
}


// MARK:- <Interactor>
protocol HelpCategoriesInteractorInput {
    func categories()
}

protocol HelpCategoriesInteractorOutput: class {
    func categories(categories: [HelpItem])
}


// MARK:- <Router>
protocol HelpCategoriesRouterInput: ClosableRouter  {
    func openCharity(helpItem: HelpItem)
}
