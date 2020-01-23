//
//  ServiceRequest.swift
//  Ahihidongoc
//
//  Created by Le Xuan Quynh on 2020/01/23.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import Foundation
import APIKit

protocol ServiceRequest: Request {}


extension ServiceRequest {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }

    func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {
        switch urlResponse.statusCode {
        case 200..<300:
            return object
        default:
            throw NSError(domain: "Bad Status Response", code: urlResponse.statusCode, userInfo: nil)
        }
    }
}

extension ServiceRequest where Response: Decodable {
    var dataParser: DataParser {
        return DecodableDataParser()
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let data = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }
        return try JSONDecoder().decode(Response.self, from: data)
    }
}

struct DecodableDataParser: DataParser {
    var contentType: String? = "application/json"

    func parse(data: Data) throws -> Any {
        return data
    }
}

