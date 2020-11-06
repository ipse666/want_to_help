//
//  DataService.swift
//  WantToHelp
//
//  Created by Vladimir Vaskin on 02.11.2020.
//

import UIKit

let DataService = DataService_.shared
class DataService_ {
    static let shared: DataService_ = DataService_()
    let fileService = FileService()
    
    func getCharity(category: String, charityResult: @escaping ([CharityEventItem]) -> ()) {
        do {
            let data = try fileService.readFile(filename: "Charity")
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            let response = try! decoder.decode(CharityItems.self, from: data)
            charityResult(response.items.filter{$0.category == category})
        } catch {
            print("Не удалось получить Json из файла")
        }
    }
    
    func getCategories(catehoriesResult: @escaping ([HelpItem]) -> ()) {
        do {
            let data = try fileService.readFile(filename: "Categories")
            let response = try! JSONDecoder().decode(HelpItems.self, from: data)
            catehoriesResult(response.items)
        } catch {
            print("Не удалось получить Json из файла")
        }
    }

}

