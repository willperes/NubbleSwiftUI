//
//  PostDataSource.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import Foundation

final class PostDataSource: PostRepository {
    private let per_page = 10
    
    @MainActor
    func getList(page: Int, completion: @escaping PostRepository.Completion) async -> Void {
        var parameters: [URLQueryItem]?
        
        // Handle pagination query parameters
        let rawQueryParams = [["page": String(page)], ["per_page": String(per_page)]]
        parameters = URLQueryBuilder.buildQueryItems(from: rawQueryParams)
        
        let endpoint: ApiEndpoint = ApiEndpoint(path: "user/post", method: ApiMethod.GET, parameters: parameters)
        
        do {
            let response: PageResponseDTO<PostResponseDTO> = try await ApiManager.shared.getData(from: endpoint)
            
            let meta = ApiAdapter.toMetaDataPageModel(from: response.meta)
            let data = response.data.map { PostAdapter.toPostModel(from: $0) }
            completion(PageModel(meta: meta, data: data), nil)
        } catch {
            completion(nil, error)
        }
    }
}
