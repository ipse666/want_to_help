//
//  CharityEventsInteractor.swift
//  WantToHelp
//
//  Created by v.vaskin on 02/11/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import Foundation

class CharityEventsInteractor: CharityEventsInteractorInput {

    weak var output: CharityEventsInteractorOutput!

    // MARK: <CharityEventsInteractorInput>
    func charity(category: String) {
        DataService.getCharity(category: category) { (charityResult) in
            DispatchQueue.global(qos: .default).async {[weak self] in
                if let `self` = self, let output = self.output {
                    output.charity(charity: charityResult)
                }
            }
        }
    }
}
