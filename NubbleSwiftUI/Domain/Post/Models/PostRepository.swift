//
//  PostRepository.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 08/05/24.
//

import Foundation

protocol PostRepository {
    typealias Completion = (_ data: PageModel<PostModel>?, _ error: Error?) -> Void
    
    func getList(page: Int, completion: @escaping Completion) async -> Void
}
