//
//  ApiManager.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import Foundation

let token = "eyJhbGciOiJSUzI1NiJ9.eyJkYXRhIjp7InVzZXJJZCI6MSwidXNlciI6eyJlbWFpbCI6Im1hcmlhanVsaWFAY29mZnN0YWNrLmNvbSJ9fSwiaWF0IjoxNzE0OTU4NTY4LCJleHAiOjIwMTQ5NjAzNjh9.KRcb45lhe8o2DBulL3g66S6LH0kwyyvThdllxmG6IWpJpxSm4UB720Nq3hadp5iHMHU347jwzSQL3MR_3ZXVgNZFiMDoHebn1j2TiCIl2Brv4szhkK5WGbXwSfc0ZiJOvRM6W_aG2iPCZsNM2USiH3HRyhLsYBiCBTWT-fWhglU-SnZqxMwvhldXrnU3SVVj4l2aQ7WMkfoxFFBzIYO3tkRxuwjDJm2DQDaiNl3xIBc3I_iYavyPX5RufKKd6q5nkgoV6-I-NqLMlmE4OnpvA1h9Hynhb9uUIB_I5Ti5PSopV_J-Kj5PEgU5Eaz8Wbe_8WsyBEVT_-z4Ff1upd48AtXES9ZSbKy0AcMYEIkZgtxmafWaKywCJi-g5VcNpofmH8ys05Oi3Rq6cLcJ_2B-GmxU1smGnz635xnIJck3DPOAt-pwl2q84pw0ejrt7JCCgamT4uSqpAC9-FvfA2Q86zStdT9rwLuWCK8aOxbWCkBnVvPdEGwXz_Ukpi8eg4nQZ8H3DipF0J5BunQWD3eCG6lzsbvAS9z8_tTGcqyWw7oV_OPA0S_zFQHxMuITXFdvkFXzgjFHzf5Uc9IneAdlflKovaGYEM6kszi6lh_vsyMjjNoWyNu6nUMbOPIirvym9IZw0T5BSWZVhUfCLh6tdfRYyKwBGK6X5zJHiEOniCI  "
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
            var urlComponents = URLComponents(url: urlPath, resolvingAgainstBaseURL: true)
        else {
            throw ApiError.invalidPath
        }
        
        if let parameters = endpoint.parameters {
            urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.name, value: String($0.value ?? "")) }
        }
        
        guard let url = urlComponents.url else {
            throw ApiError.invalidUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(accessToken, forHTTPHeaderField: "Authorization")
        return request
    }
}
