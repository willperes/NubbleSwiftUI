//
//  PostCommentService.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 06/05/24.
//

import Foundation

typealias PostCommentResponse = PageModel<PostCommentModel>

class PostCommentService {
    private let api: PostCommentApi
    
    init(api: PostCommentApi = PostCommentApi()) {
        self.api = api
    }
    
    func getList(postId: Int, page: Int) async throws -> PostCommentResponse {
        let response = try await api.getList(postId, PageParamsModel(page: page, per_page: 20))
        
        let meta = ApiAdapter.toMetaDataPageModel(from: response.meta)
        let data = response.data.map { PostCommentAdapter.toPosCommenttModel(from: $0) }
        return PostCommentResponse(meta: meta, data: data)
    }
}
