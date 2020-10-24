//
//  Utils.swift
//  evoclub
//
//  Created by Vitaliy Zaretskiy on 22/05/2019.
//  Copyright © 2019 Studio-Evolution. All rights reserved.
//

import Foundation

struct Utils {
    static func runAfterDelay(_ delay: TimeInterval, block: @escaping ()->()) {
        let time = DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: time, execute: block)
    }
}

