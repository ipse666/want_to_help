//
//  DescriptionEventPresenter.swift
//  WantToHelp
//
//  Created by v.vaskin on 04/11/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import Foundation

class DescriptionEventPresenter {
    weak var view: DescriptionEventViewInput!
    var interactor: DescriptionEventInteractorInput!
    var router: DescriptionEventRouterInput!
    private var charityEventItem: CharityEventItem
    private let compactDateFormatter = DateFormatter()
    private let fullDateFormatter = DateFormatter()
    
    init(charityEventItem: CharityEventItem) {
        self.charityEventItem = charityEventItem
    }
}

// MARK:- <DescriptionEventViewOutput>
extension DescriptionEventPresenter: DescriptionEventViewOutput {
    func viewIsReady() {
        compactDateFormatter.dateFormat = "d.MM"
        fullDateFormatter.locale = Locale(identifier: "ru_RU")
        fullDateFormatter.dateFormat = "LLLL d, yyyy"
        view.setupInitialState(charityEventItem: charityEventItem)
    }

    func backPressed(animated: Bool) {
        router.close(animated: animated)
    }
    
    func dateString(startDate: Date?, endDate: Date?) -> String {
        if endDate != nil {
            if startDate != nil && startDate!.timeIntervalSince1970 > 0 {
                let currentDate = Date()
                let remainDays = endDate! > currentDate ? Calendar.current.dateComponents([.day], from: currentDate, to: endDate!).day ?? 0 : 0
                var labelValue = String(format: Constants.ui.description.remains, remainDays > 0 ? remainDays + 1 : 0)
                labelValue.append(String(format: " (%@ - %@)", compactDateFormatter.string(from: startDate!), compactDateFormatter.string(from: endDate!)))
                return labelValue
            } else {
                return fullDateFormatter.string(from: endDate!).capitalized
            }
        }
        return ""
    }
}

// MARK:- <DescriptionEventInteractorOutput>
extension DescriptionEventPresenter: DescriptionEventInteractorOutput {

}
