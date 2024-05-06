//
//  PostService.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import Foundation

typealias PostResponse = PageModel<PostModel>

class PostService {
    private let api: PostApi
    
    init(api: PostApi = PostApi()) {
        self.api = api
    }
    
    func getList(page: Int) async throws -> PostResponse {
        let response = try await api.getList(PageParamsModel(page: page, per_page: 10))
        
        let meta = ApiAdapter.toMetaDataPageModel(from: response.meta)
        let data = response.data.map { PostAdapter.toPostModel(from: $0) }
        return PostResponse(meta: meta, data: data)
    }
}
