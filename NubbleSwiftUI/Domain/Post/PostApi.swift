//
//  PostApi.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import Foundation

internal class PostApi {
    func getList(_ pageParams: PageParamsModel?) async throws -> PageApiModel<PostApiModel> {
        var parameters: [URLQueryItem]?
        
        if let page = pageParams?.page, let per_page = pageParams?.per_page {
            let rawQueryParams = [["page": String(page)], ["per_page": String(per_page)]]
            parameters = URLQueryBuilder.buildQueryItems(from: rawQueryParams)
        }
        
        let endpoint: ApiEndpoint = ApiEndpoint(path: "user/post", method: ApiMethod.GET, parameters: parameters)
        
        let response: PageApiModel<PostApiModel> = try await ApiManager.shared.getData(from: endpoint)
        return response
    }
}
