//
//  Services.swift
//  Ahihidongoc
//
//  Created by Le Xuan Quynh on 2020/01/23.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import Foundation
import APIKit

final class Services {}

extension Services {
    struct SearchRequest: ServiceRequest {
        // MARK: - Initialize
        let language: String
        let page: Int

        init(language: String, page: Int) {
            self.language = language
            self.page = page
        }


        // MARK: - Request Type
        let method: HTTPMethod = .get
        let path: String = "/search/repositories"

        var parameters: Any? {
            var params = [String: Any]()
            params["q"] = language
            params["sort"] = "stars"
            params["page"] = "\(page)"
            return params
        }

        func response(from object: Any, urlResponse: HTTPURLResponse) throws -> [GitHubRepository] {
            guard let data = object as? Data else {
                throw ResponseError.unexpectedObject(object)
            }
            let res = try JSONDecoder().decode(SearchRepositoriesResponse.self, from: data)
            return res.items
        }
        
    }
}
