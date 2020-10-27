//
//  LaunchLoadingViewController.swift
//  WantToHelp
//
//  Created by v.vaskin on 24/10/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import Foundation

struct Utils {
    static func runAfterDelay(_ delay: TimeInterval, block: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: block)
    }
}

