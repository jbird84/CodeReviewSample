//
//  InformationModel.swift
//  CodeReviewSample
//
//  Created by Kinney Kare on 2/23/25.
//

import Foundation

struct InformationModel: Codable {
    let url: URL
    let origin: String
    let headers: InformationHeadersModel
    let method: String
    let json: JSONBody?
}

class InformationHeadersModel: Codable {
    let accept: String
    let acceptEncoding: String
    let acceptLanguage: String
    let host: String
    let userAgent: String
    let contentType: String?

    enum CodingKeys: String, CodingKey {
        case accept = "Accept"
        case acceptEncoding = "Accept-Encoding"
        case acceptLanguage = "Accept-Language"
        case host = "Host"
        case userAgent = "User-Agent"
        case contentType = "Content-Type"
    }
}

struct JSONBody: Codable {
    let success: Bool
    let date: String
}
