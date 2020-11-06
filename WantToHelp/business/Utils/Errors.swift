//
//  Errors.swift
//  WantToHelp
//
//  Created by Vladimir Vaskin on 02.11.2020.
//

import Foundation

public enum FileError: Error {
    case readFile

    public var description: String {
        switch self {
        case .readFile: return NSLocalizedString("Read file error", comment: "")
        }
    }
}
