//
//  PostListUseCase.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 06/05/24.
//

import Foundation

class PostListUseCase {
    typealias FetchCompletion = ([PostModel]?, _ skipped: Bool?, Error?) -> Void
    
    private let postService: PostService
    private var page = 1
    private var hasNextPage = true
    
    init(postService: PostService = PostService()) {
        self.postService = postService
    }
    
    @MainActor
    func fetchInitialData(completion: @escaping FetchCompletion) async {
        do {
            let response = try await postService.getList(page: page)
            
            if response.meta.hasNextPage {
                page = 2
            } else {
                hasNextPage = false
            }
            
            completion(response.data, nil, nil)
        } catch {
            completion(nil, nil, error)
        }
    }
    
    @MainActor
    func fetchMoreData(_ isFetchingMore: Bool, completion: @escaping FetchCompletion) async {
        if isFetchingMore || !hasNextPage {
            completion(nil, true, nil)
            return
        }
        
        do {
            let response = try await postService.getList(page: page)
            
            if response.meta.hasNextPage {
                page = page + 1
            } else {
                hasNextPage = false
            }
            
            completion(response.data, nil, nil)
        } catch {
            completion(nil, nil, error)
        }
    }
}
