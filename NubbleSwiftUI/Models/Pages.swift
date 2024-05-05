//
//  Pages.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import Foundation

struct MetaDataPageModel {
    let total: Int
    let perPage: Int
    let currentPage: Int
    let lastPage: Int
    let firstPage: Int
    let hasNextPage: Bool
    let hasPreviousPage: Bool
}

struct PageModel<Data> {
    let meta: MetaDataPageModel
    let data: [Data]
}
