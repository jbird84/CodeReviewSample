//
//  URLManager.swift
//  CodeReviewSample
//
//  Created by Kinney Kare on 2/23/25.
//

import Foundation

class URLManager {
    
    static let shared = URLManager()
    private let session: URLSession
    
    private init() {
        session = URLSession(configuration: URLSessionConfiguration.default)
    }
    
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
    }
    
    struct HTTPHeaderField {
        static let contentType = "Content-Type"
    }
    
    struct ContentTypeValue {
        static let json = "application/json"
    }
    
    /// Performs an asynchronous HTTP request and returns the response data.
    /// - Parameters:
    ///   - url: The URL to fetch.
    ///   - method: The HTTP method (GET, POST, etc.).
    ///   - body: The optional JSON body to include in the request.
    /// - Returns: The data from the server response.
    /// - Throws: An error if the request fails or if the response status code indicates an error.
    func request(url: URL, withMethod method: HTTPMethod, andBody body: JSONBody? = nil) async throws -> Data {
        var requst = URLRequest(url: url)
        requst.httpMethod = method.rawValue
        
        if let body = body {
            requst.httpBody = try? JSONEncoder().encode(body)
            requst.addValue(ContentTypeValue.json, forHTTPHeaderField: HTTPHeaderField.contentType)
        }
        
        do {
            let (data, response) = try await session.data(for: requst)
            if let httpResponse = response as? HTTPURLResponse {
                guard (200...299).contains(httpResponse.statusCode) else {
                    throw URLError(.badServerResponse)
                }
            }
            return data
        } catch {
            throw error
        }
    }
}
