//
//  JsonFileService.swift
//  WantToHelp
//
//  Created by Vladimir Vaskin on 02.11.2020.
//

import Foundation

typealias JSON = [String: Any]

protocol FileServiceProtocol {
    func readFile(filename: String) throws -> Data
}

class FileService: FileServiceProtocol {
    
    func readFile(filename: String) throws -> Data {
        let filePath = Bundle.main.url(forResource: filename, withExtension: "json")!
        let data: Data
        do {
            data = try Data(contentsOf: filePath)
        } catch {
            throw FileError.readFile
        }
        
        return data
    }
}

