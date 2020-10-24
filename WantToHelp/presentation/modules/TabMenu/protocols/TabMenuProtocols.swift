//
//  TabMenuProtocols.swift
//  WantToHelp
//
//  Created by v.vaskin on 24/10/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import Foundation

// MARK:- <View>
protocol TabMenuViewInput: class {
    func setupInitialState()
}

protocol TabMenuViewOutput {
    func viewIsReady()
    func backPressed(animated: Bool)
}


// MARK:- <Interactor>
protocol TabMenuInteractorInput {

}

protocol TabMenuInteractorOutput: class {

}


// MARK:- <Router>
protocol TabMenuRouterInput: ClosableRouter  {

}
