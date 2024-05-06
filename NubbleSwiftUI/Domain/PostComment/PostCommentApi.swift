//
//  PostCommentApi.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 06/05/24.
//

import Foundation

class PostCommentApi {
    func getList(_ postId: Int, _ pageParams: PageParamsModel?) async throws -> PageApiModel<PostCommentApiModel> {
        var parameters: [URLQueryItem]?
        
        if let page = pageParams?.page, let per_page = pageParams?.per_page {
            let rawQueryParams = [["post_id": String(postId)], ["page": String(page)], ["per_page": String(per_page)]]
            parameters = URLQueryBuilder.buildQueryItems(from: rawQueryParams)
        }
        
        let endpoint: ApiEndpoint = ApiEndpoint(path: "user/post_comment", method: ApiMethod.GET, parameters: parameters)
        
        let response: PageApiModel<PostCommentApiModel> = try await ApiManager.shared.getData(from: endpoint)
        return response
    }
}
