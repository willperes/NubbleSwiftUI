//
//  ApiError.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import Foundation

enum ApiError: Error {
   case invalidPath
   case decoding
}

extension ApiError {
   var localizedDescription: String {
      switch self {
      case .invalidPath:
         return "Invalid Path"
      case .decoding:
         return "There was an error decoding the type"
      }
   }
}
