//
//  PageApiModel.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import Foundation

struct PageApiModel<D: Decodable>: Decodable {
    let meta: MetaDataPageApiModel
    let data: [D]
}

struct MetaDataPageApiModel: Decodable {
    let total: Int
    let per_page: Int
    let current_page: Int
    let last_page: Int
    let first_page: Int
    let first_page_url: String
    let last_page_url: String
    let next_page_url: String?
    let previous_page_url: String?
}
