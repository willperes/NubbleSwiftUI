//
//  ApiEndpoint.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import Foundation

enum ApiMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

struct ApiEndpoint {
    let path: String
    let method: ApiMethod
    let parameters: [URLQueryItem]?
}

class URLQueryBuilder {
    static func buildQueryItems(from items: [[String:String]]) -> [URLQueryItem]? {
        if items.isEmpty { return nil }
        
        var queryItems = [URLQueryItem]()
        
        for item in items {
            for (name, value) in item {
                queryItems.append(URLQueryItem(name: name, value: value))
            }
        }
        
        return queryItems
    }
}
