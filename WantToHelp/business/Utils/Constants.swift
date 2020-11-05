//
//  Constants.swift
//  WantToHelp
//
//  Created by Vladimir Vaskin on 24.10.2020.
//

import UIKit

// MARK:- Defaults
struct Constants {
    struct ui {
        struct tabbar {
            static let centralButtonOffset: CGFloat = 15.0
        }
        struct pageTitles {
            static let news = NSLocalizedString("Новости", comment: "")
            static let search = NSLocalizedString("Поиск", comment: "")
            static let help = NSLocalizedString("Помочь", comment: "")
            static let history = NSLocalizedString("История", comment: "")
            static let profile = NSLocalizedString("Профиль", comment: "")
        }
        struct charity {
            static let current = NSLocalizedString("Текущие", comment: "")
            static let completed = NSLocalizedString("Завершенные", comment: "")
            static let title = NSLocalizedString("Дети", comment: "")
            static let remains = NSLocalizedString("Остается %lu дней", comment: "")
        }
        struct description {
            static let remains = NSLocalizedString("Осталось %lu дней", comment: "")
            static let haveQuestions = NSLocalizedString("У вас есть вопросы?", comment: "")
            static let writeUs = NSLocalizedString("Напишите нам", comment: "")
            static let organizationSite = NSLocalizedString("Перейти на сайт организации", comment: "")
        }
    }
}

