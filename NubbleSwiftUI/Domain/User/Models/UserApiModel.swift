//
//  UserApiModel.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import Foundation

struct UserApiModel: Decodable {
    let id: Int
    let first_name: String
    let last_name: String
    let username: String
    let email: String
    let profile_url: String
    let is_online: Bool
    let full_name: String
}
