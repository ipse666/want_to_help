//
//  CharityEventsPresenter.swift
//  WantToHelp
//
//  Created by v.vaskin on 02/11/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import Foundation

class CharityEventsPresenter {

    weak var view: CharityEventsViewInput!
    var interactor: CharityEventsInteractorInput!
    var router: CharityEventsRouterInput!
    private var category: String
    private let compactDateFormatter = DateFormatter()
    private let fullDateFormatter = DateFormatter()
    
    init(category: String) {
        self.category = category
    }
}

// MARK:- <CharityEventsViewOutput>
extension CharityEventsPresenter: CharityEventsViewOutput {
    func viewIsReady() {
        compactDateFormatter.dateFormat = "d.MM"
        fullDateFormatter.locale = Locale(identifier: "ru_RU")
        fullDateFormatter.dateFormat = "LLLL d, yyyy"
        view.setupInitialState()
        interactor.charity(category: category)
    }

    func backPressed(animated: Bool) {
        router.close(animated: animated)
    }
    
    func openDescription(charity: CharityEventItem) {
        router.openDescription(charity: charity)
    }
    
    func dateString(startDate: Date?, endDate: Date?) -> String {
        if endDate != nil {
            if startDate != nil && startDate!.timeIntervalSince1970 > 0 {
                let currentDate = Date()
                let remainDays = endDate! > currentDate ? Calendar.current.dateComponents([.day], from: currentDate, to: endDate!).day ?? 0 : 0
                var labelValue = String(format: Constants.ui.charity.remains, remainDays > 0 ? remainDays + 1 : 0)
                labelValue.append(String(format: " (%@ - %@)", compactDateFormatter.string(from: startDate!), compactDateFormatter.string(from: endDate!)))
                return labelValue
            } else {
                return fullDateFormatter.string(from: endDate!).capitalized
            }
        }
        return ""
    }
}

// MARK:- <CharityEventsInteractorOutput>
extension CharityEventsPresenter: CharityEventsInteractorOutput {
    func charity(charity: [CharityEventItem]) {
        view.updateСharity(charity: charity)
    }
}
