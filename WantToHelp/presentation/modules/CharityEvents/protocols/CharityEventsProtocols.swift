//
//  CharityEventsProtocols.swift
//  WantToHelp
//
//  Created by v.vaskin on 02/11/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import Foundation

// MARK:- <View>
protocol CharityEventsViewInput: class {
    func setupInitialState()
    func updateСharity(charity: [CharityEventItem])
}

protocol CharityEventsViewOutput {
    func viewIsReady()
    func backPressed(animated: Bool)
    func openDescription(charity: CharityEventItem)
}


// MARK:- <Interactor>
protocol CharityEventsInteractorInput {
    func charity(category: String)
}

protocol CharityEventsInteractorOutput: class {
    func charity(charity: [CharityEventItem])
}


// MARK:- <Router>
protocol CharityEventsRouterInput: ClosableRouter  {
    func openDescription(charity: CharityEventItem)
}
