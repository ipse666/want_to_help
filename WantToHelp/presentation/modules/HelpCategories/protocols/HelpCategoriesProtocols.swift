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
    func setupInitialState(helpes: [HelpItem])
}

protocol HelpCategoriesViewOutput {
    func viewIsReady()
    func backPressed(animated: Bool)
}


// MARK:- <Interactor>
protocol HelpCategoriesInteractorInput {

}

protocol HelpCategoriesInteractorOutput: class {

}


// MARK:- <Router>
protocol HelpCategoriesRouterInput: ClosableRouter  {

}
