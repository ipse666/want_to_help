//
//  LaunchLoadingProtocols.swift
//  WantToHelp
//
//  Created by v.vaskin on 24/10/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import Foundation

// MARK:- <View>
protocol LaunchLoadingViewInput: class {
    func setupInitialState()
}

protocol LaunchLoadingViewOutput {
    func viewIsReady()
    func backPressed(animated: Bool)
}


// MARK:- <Interactor>
protocol LaunchLoadingInteractorInput {

}

protocol LaunchLoadingInteractorOutput: class {

}


// MARK:- <Router>
protocol LaunchLoadingRouterInput: ClosableRouter  {
    func openHelpCatigories()
}
