//
//  HelpItem.swift
//  WantToHelp
//
//  Created by Vladimir Vaskin on 24.10.2020.
//

import Foundation

struct HelpItem: Codable {
    var name: String
    var photoName: String 
    
    enum CodingKeys: String, CodingKey {
        case name, photoName
    }
}
