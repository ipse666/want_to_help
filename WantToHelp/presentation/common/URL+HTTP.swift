//
//  LaunchLoadingViewController.swift
//  WantToHelp
//
//  Created by v.vaskin on 24/10/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import Foundation

extension URL {
    static func httpURL(withString string: String) -> URL? {
        let urlString: String
        
        if (string.starts(with: "http://") || string.starts(with: "https://")) {
            urlString = string
        } else {
            urlString = "http://" + string
        }
        
        return URL(string: urlString)
    }
}
