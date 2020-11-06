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
    var email: String
    var site: String
    var description: String
    var photoNames: [String]
    var startDate: Date?
    var endDate: Date?
    
    enum CodingKeys: String, CodingKey {
        case id, category, head, description, startDate, endDate
        case email, site, organization, address, phones
        case photoNames = "photos"
    }
}

struct CharityItems: Codable
{
    var items: [CharityEventItem]
}
