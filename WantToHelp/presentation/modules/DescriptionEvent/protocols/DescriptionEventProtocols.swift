//
//  DescriptionEventProtocols.swift
//  WantToHelp
//
//  Created by v.vaskin on 04/11/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import Foundation

// MARK:- <View>
protocol DescriptionEventViewInput: class {
    func setupInitialState(charityEventItem: CharityEventItem)
}

protocol DescriptionEventViewOutput {
    func viewIsReady()
    func backPressed(animated: Bool)
}


// MARK:- <Interactor>
protocol DescriptionEventInteractorInput {

}

protocol DescriptionEventInteractorOutput: class {

}


// MARK:- <Router>
protocol DescriptionEventRouterInput: ClosableRouter  {

}
