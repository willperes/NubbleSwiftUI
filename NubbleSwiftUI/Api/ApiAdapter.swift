//
//  ApiAdapter.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import Foundation

class ApiAdapter {
    static func toMetaDataPageModel(from metaDataPageApiModel: MetaDataPageApiModel) -> MetaDataPageModel {
        let model = MetaDataPageModel(
            total: metaDataPageApiModel.total,
            perPage: metaDataPageApiModel.per_page,
            currentPage: metaDataPageApiModel.current_page,
            lastPage: metaDataPageApiModel.last_page,
            firstPage: metaDataPageApiModel.first_page,
            hasNextPage: metaDataPageApiModel.next_page_url != nil,
            hasPreviousPage: metaDataPageApiModel.previous_page_url != nil
        )
        return model
    }
}
