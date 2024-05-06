//
//  PostCommentScreenViewModel.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 06/05/24.
//

import Foundation

class PostCommentScreenViewModel: ObservableObject {
    private let postId: Int
    private let useCase = PostCommentListUseCase()
    
    @Published var data: [PostCommentModel] = []
    @Published var isLoading = true
    @Published var isFetchingMore = false
    @Published var isError = false
    
    init(postId: Int) {
        self.postId = postId
        
        Task {
            await fetchInitialData()
        }
    }
    
    func shouldFetchMore(index: Int) {
        print("\(index) \(data.count - 1)")
        if index == data.count - 1 {
            Task {
                await fetchMoreData()
            }
        }
    }
    
    @MainActor
    func fetchInitialData() async {
        isLoading = true
        isError = false
        
        await useCase.fetchInitialData(self.postId) { data, skipped, error in
            guard let postCommentListData = data else {
                self.isError = skipped != true
                self.isLoading = false
                return
            }
            
            self.data = postCommentListData
            self.isLoading = false
            self.isError = false
        }
    }
    
    @MainActor
    func fetchMoreData() async {
        let oldIsFetchingMoreValue = isFetchingMore
        
        isFetchingMore = true
        isError = false
        
        await useCase.fetchMoreData(self.postId, oldIsFetchingMoreValue) { additionalData, skipped, error in
            guard let postListData = additionalData else {
                self.isError = skipped != true
                self.isFetchingMore = false
                return
            }
            
            self.data.append(contentsOf: postListData)
            self.isFetchingMore = false
            self.isError = false
        }
    }
}
