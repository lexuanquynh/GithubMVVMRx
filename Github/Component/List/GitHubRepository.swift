//
//  GitHubRepository.swift
//  Ahihidongoc
//
//  Created by Le Xuan Quynh on 2020/01/23.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import Foundation

struct GitHubRepository: Decodable {
    let id: Int
    let fullName: String
    let description: String
    let stargazersCount: Int
    let url: URL

    private enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case description
        case stargazersCount = "stargazers_count"
        case url = "html_url"
    }

}

struct SearchRepositoriesResponse: Decodable {
    let items: [GitHubRepository]
}
