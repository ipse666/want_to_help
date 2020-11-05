//
//  CharityEventItem.swift
//  WantToHelp
//
//  Created by Vladimir Vaskin on 02.11.2020.
//

import UIKit

struct CharityEventItem: Codable {
    var id: Int
    var category: String
    var head: String
    var organization: String
    var address: String
    var phones: [String]
    var description: String
    var photoNames: [String]
    var deadline: UInt
    var date: UInt
    
    enum CodingKeys: String, CodingKey {
        case id, category, head, organization, address, phones, description, deadline, date
        case photoNames = "photos"
    }
}

struct CharityItems: Codable
{
    var items: [CharityEventItem]
}
