//
//  GitHubAPI.swift
//  SampleProject
//
//  Created by kurokawahirokazu on 2020/08/30.
//  Copyright © 2020 kurokawahirokazu. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
}

protocol Request {
    associatedtype Response: Decodable
    var baseURL: URL { get }
    var path: String { get }
    var keyword: String { get }
    var method: HTTPMethod { get }
}

extension Request {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
}

final class GitHubAPI {
    struct SearchRepositories: Request {
        var keyword: String
        typealias Response = SearchResponse<Repository>
        var method: HTTPMethod {
            return .get
        }
        var path: String {
            return "/search/repositories"
        }
    }
    struct SearchUsers: Request {
        typealias Response = SearchResponse<User>
        var keyword: String
        var method: HTTPMethod {
            return .get
        }
        var path: String {
            return "/search/users"
        }
    }
}
