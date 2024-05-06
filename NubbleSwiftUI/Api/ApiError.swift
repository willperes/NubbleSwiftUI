//
//  ApiError.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import Foundation

enum ApiError: Error {
    case invalidPath
    case invalidUrl
    case decoding
}

extension ApiError {
    var localizedDescription: String {
        switch self {
        case .invalidPath:
            return "Invalid Path"
        case .invalidUrl:
            return "Invalid URL"
        case .decoding:
            return "There was an error decoding the type"
        }
    }
}
