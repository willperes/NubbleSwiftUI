//
//  PostCommentListUseCase.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 06/05/24.
//

import Foundation

final public class PostCommentListUseCase {
    typealias FetchCompletion = ([PostCommentModel]?, _ skipped: Bool?, Error?) -> Void
    
    private let repository: PostCommentRepository
    private var page = 1
    private var hasNextPage = true
    
    init(repository: PostCommentRepository) {
        self.repository = repository
    }
    
    @MainActor
    func fetchInitialData(_ postId: Int, completion: @escaping FetchCompletion) async {
        await repository.getList(postId: postId, page: page) { response, error in
            guard let response = response, error == nil else {
                completion(nil, nil, error)
                return
            }
            
            if response.meta.hasNextPage {
                self.page = 2
            } else {
                self.hasNextPage = false
            }
            
            completion(response.data, nil, nil)
        }
    }
    
    @MainActor
    func fetchMoreData(_ postId: Int, _ isFetchingMore: Bool, completion: @escaping FetchCompletion) async {
        if isFetchingMore || !hasNextPage {
            completion(nil, true, nil)
            return
        }
        
        await repository.getList(postId: postId, page: page) { response, error in
            guard let response = response, error == nil else {
                completion(nil, nil, error)
                return
            }
            
            if response.meta.hasNextPage {
                self.page = self.page + 1
            } else {
                self.hasNextPage = false
            }
            
            completion(response.data, nil, nil)
        }
    }
}

