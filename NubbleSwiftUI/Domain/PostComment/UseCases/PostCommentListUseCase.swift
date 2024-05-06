//
//  PostCommentListUseCase.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 06/05/24.
//

import Foundation

class PostCommentListUseCase {
    typealias FetchCompletion = ([PostCommentModel]?, _ skipped: Bool?, Error?) -> Void
    
    private let postCommentService: PostCommentService
    private var page = 1
    private var hasNextPage = true
    
    init(postCommentService: PostCommentService = PostCommentService()) {
        self.postCommentService = postCommentService
    }
    
    @MainActor
    func fetchInitialData(_ postId: Int, completion: @escaping FetchCompletion) async {
        do {
            let response = try await postCommentService.getList(postId: postId, page: page)
            
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
    func fetchMoreData(_ postId: Int, _ isFetchingMore: Bool, completion: @escaping FetchCompletion) async {
        if isFetchingMore || !hasNextPage {
            completion(nil, true, nil)
            return
        }
        
        do {
            let response = try await postCommentService.getList(postId: postId, page: page)
            
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

