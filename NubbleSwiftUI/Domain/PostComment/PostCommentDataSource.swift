//
//  PostCommentDataSource.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 08/05/24.
//

import Foundation

class PostCommentDataSource: PostCommentRepository {
    private let per_page = 15
    
    @MainActor
    func getList(postId: Int, page: Int, completion: @escaping Completion) async {
        var parameters: [URLQueryItem]?
        
        // Handle pagination query parameters
        let rawQueryParams = [["post_id": String(postId)], ["page": String(page)], ["per_page": String(per_page)]]
        parameters = URLQueryBuilder.buildQueryItems(from: rawQueryParams)
        
        let endpoint: ApiEndpoint = ApiEndpoint(path: "user/post_comment", method: ApiMethod.GET, parameters: parameters)
        
        do {
            let response: PageResponseDTO<PostCommentResponseDTO> = try await ApiManager.shared.getData(from: endpoint)
            
            let meta = ApiAdapter.toMetaDataPageModel(from: response.meta)
            let data = response.data.map { PostCommentAdapter.toPostCommentModel(from: $0) }
            completion(PageModel(meta: meta, data: data), nil)
        } catch {
            completion(nil, error)
        }
    }
}
