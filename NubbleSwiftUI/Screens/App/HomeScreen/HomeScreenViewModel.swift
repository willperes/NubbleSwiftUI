//
//  HomeScreenViewModel.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import SwiftUI

class HomeScreenViewModel: ObservableObject {
    private let useCase = PostListUseCase()
    
    @Published var data: [PostModel] = []
    @Published var isLoading = true
    @Published var isFetchingMore = false
    @Published var isError = false
    
    init() {
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
        
        await useCase.fetchInitialData { data, skipped, error in
            guard let postListData = data else {
                self.isError = skipped != true
                self.isLoading = false
                return
            }
            
            self.data = postListData
            self.isLoading = false
            self.isError = false
        }
    }
    
    @MainActor
    func fetchMoreData() async {
        let oldIsFetchingMoreValue = isFetchingMore
        
        isFetchingMore = true
        isError = false
        
        await useCase.fetchMoreData(oldIsFetchingMoreValue) { additionalData, skipped, error in
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
