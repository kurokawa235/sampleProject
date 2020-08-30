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

protocol GitHubRequest {
    associatedtype Response: Decodable
    var baseURL: URL { get }
    var path: String { get }
    var keyword: String { get }
    var method: HTTPMethod { get }
}

extension GitHubRequest {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
//    func buildURLRequest() -> URLRequest {
//        let url = baseURL.appendingPathComponent(path)
//        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
//        components?.queryItems = queryItems
//
//        var urlRequest = URLRequest(url: url)
//        urlRequest.url = components?.url
//        urlRequest.httpMethod = method.rawValue
//
//        return urlRequest
//    }
    
    func response(from data: Data, urlResponse: URLResponse) throws -> Response {
        let decoder = JSONDecoder()
        if case (200..<300)? = (urlResponse as? HTTPURLResponse)?.statusCode {
            return try decoder.decode(Response.self, from: data)
        } else {
            throw NSError()
        }
    }
}

final class GitHubAPI {
    struct SearchRepositories: GitHubRequest {
        var keyword: String
        typealias Response = SearchResponse<Repository>
        var method: HTTPMethod {
            return .get
        }
        var path: String {
            return "/search/repositories"
        }
    }
    struct SearchUsers: GitHubRequest {
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
