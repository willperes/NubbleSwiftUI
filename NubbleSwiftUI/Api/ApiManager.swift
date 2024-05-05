//
//  ApiManager.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import Foundation

let token = "eyJhbGciOiJSUzI1NiJ9.eyJkYXRhIjp7InVzZXJJZCI6MSwidXNlciI6eyJlbWFpbCI6Im1hcmlhanVsaWFAY29mZnN0YWNrLmNvbSJ9fSwiaWF0IjoxNzE0OTQ5MDk0LCJleHAiOjE3MTQ5NTA4OTR9.Fc7kzm0DEXrSukgTT79nZ4c4TpUdCIDJAy4WwNH9aIm1mehBYINQXMW0GHjlkcKAUNbfFDQOoHxehPHh_YslYise4TjGm9v1bp0PajGqm0Eup-nmii79LiP14Kym2BiIqqwAVAtH3g9BHVpAZO6qGVQBnMRt2OJ8NJsoaOk5DOrIwh5oGdoeaGia2AVNHc9sCHtnH2upErywdPf6g0iqd1TrBeEdn7ITYKav2DxQgz9TqD1_s2rnm074Dh6wcNBuEUUSWhLQOA4QXHOhvkwvMHJ--zWbArvV3rm-wsWprw-DwJIPITMp3OwOtPUbgxHGNB8qcke0DPZsj20sk4vbGyYnyYkxe3UGtI4Al6679x5SMnSP8M7x7hsSfX5U4M5M4XKRrVxIU5Jtr0Pra0q97G7ymj7S9701D1SPpNbTIJD8ob0_dhh0QToZMUlL6CZ4dYuVv7K_Qd3Z_em4V6YyOI9GRqGVbIxFk429RI5lgafvyZx30zcRqcplYzBPNGzxfCCv8oSn0j9Qk_6sqdEyeGy4hmKoPjLJazNeD7RiZH7IVBTMyF8Ei2-J3nB-cNzWpia90QcuHhu2PGRQTUZ_nRz9uWO22taWLpKfsoTC4gxO1nRmxgPU1x0St9ryCbFXAs4I-ay4YdCtPnXfbvY5d0VVP9Y12RmJQ4KswBQV58Q"
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
