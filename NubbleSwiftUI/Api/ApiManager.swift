//
//  ApiManager.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import Foundation

let token = "eyJhbGciOiJSUzI1NiJ9.eyJkYXRhIjp7InVzZXJJZCI6MSwidXNlciI6eyJlbWFpbCI6Im1hcmlhanVsaWFAY29mZnN0YWNrLmNvbSJ9fSwiaWF0IjoxNzE0OTU4NTY4LCJleHAiOjE3MTQ5NjAzNjh9.m-SfafpgMmTLBv6eRoTzYu-5K9PSIrw9aUkiz4lIz8wFZ66oIK1l6ENjEDebD5afwlWmn9bJC4ymT3aH1tRoYx1fuD4JrNoDSR3bhcwdJKlnqNi-gSeLZXB_l4RiiK81CQGDcwGIJxLfANuLTUHB2RMrTzKoK8PcFJzVrzQVphIDy3PoeC4EbnlM-uyTWuYehibEKiMHrg8sVuv5mnDZbc67LO5t1SrOCTdf-P3Leh8l_1MwCDm4WK21M3xXnVoehVoHXcZoIKIL3OxSo1DjZkmVv9u79FZd6HlkQLcM9ljfZvbnhh_Ecw2ENZ3RHERorRqyoMBqUYLriYc0JdvWOMQhrqUuZxvfRX6GXlAUMEUcR1x-g0MOsMljtlBo0A5_MPaEiVsphInifprzayXBl4_gHQKrWP4WWQkLJ9ZPWzqi-Ewu6wk0hXu-SdQvAoT6Y_bP1W71qVxSbkVmS6n659E7amHRW1QOgd0ZXaeaJK32hKsXzfyq-4I2GZ00zUErBNuCyYroKuNudb3d5pvjyPM3XEgeR4pE4gM95UOJFkTwSHvJ4coEFjmrxRApOfQYAKLtxPepiKY5MER4Z7_JJOdWMiuUWlCFxS9kh0j6Sxo3Yh7CXNRDNdQt1OFwxMwAaL5saWt0HZAJqkjldz1KIYoo41-uaqEjNPOqfbhlhVc"
let accessToken = "Bearer \(token)"

final class ApiManager {
    typealias NetworkResponse = (data: Data, response: URLResponse)
    
    static let shared = ApiManager()
    
    private let baseURL = "http://127.0.0.1:3333/"
    private let session = URLSession.shared
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    func getData<D: Decodable>(from endpoint: ApiEndpoint) async throws -> D {
        let request = try createRequest(from: endpoint)
        let response: NetworkResponse = try await session.data(for: request)
        return try decoder.decode(D.self, from: response.data)
    }
    
    func sendData<D: Decodable, E: Encodable>(from endpoint: ApiEndpoint, with body: E) async throws -> D {
        let request = try createRequest(from: endpoint)
        let data = try encoder.encode(body)
        let response: NetworkResponse = try await session.upload(for: request, from: data)
        return try decoder.decode(D.self, from: response.data)
    }
}

private extension ApiManager {
    func createRequest(from endpoint: ApiEndpoint) throws -> URLRequest {
        guard
            let urlPath = URL(string: baseURL.appending(endpoint.path)),
            var urlComponents = URLComponents(string: urlPath.path)
        else {
            throw ApiError.invalidPath
        }
        
        if let parameters = endpoint.parameters {
            urlComponents.queryItems = parameters
        }
        
        var request = URLRequest(url: urlPath)
        request.httpMethod = endpoint.method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(accessToken, forHTTPHeaderField: "Authorization")
        return request
    }
}
