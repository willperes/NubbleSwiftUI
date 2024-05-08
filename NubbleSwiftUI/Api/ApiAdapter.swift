//
//  ApiAdapter.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import Foundation

class ApiAdapter {
    static func toMetaDataPageModel(from dto: MetaDataPageResponseDTO) -> MetaDataPageModel {
        let model = MetaDataPageModel(
            total: dto.total,
            perPage: dto.per_page,
            currentPage: dto.current_page,
            lastPage: dto.last_page,
            firstPage: dto.first_page,
            hasNextPage: dto.next_page_url != nil,
            hasPreviousPage: dto.previous_page_url != nil
        )
        return model
    }
}
