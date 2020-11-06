//
//  UIWindow+key.swift
//  WantToHelp
//
//  Created by Vladimir Vaskin on 02.11.2020.
//

import UIKit

extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
