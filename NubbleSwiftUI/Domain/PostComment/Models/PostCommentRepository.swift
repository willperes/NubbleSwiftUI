//
//  PostRepository.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 08/05/24.
//

import Foundation

protocol PostCommentRepository {
    typealias Completion = (_ data: PageModel<PostCommentModel>?, _ error: Error?) -> Void
    
    func getList(postId: Int, page: Int, completion: @escaping Completion) async -> Void
}
