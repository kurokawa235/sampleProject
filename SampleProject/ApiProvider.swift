//
//  ApiProvider.swift
//  SampleProject
//
//  Created by kurokawahirokazu on 2020/08/30.
//  Copyright © 2020 kurokawahirokazu. All rights reserved.
//
import Foundation
import Alamofire

class ApiProvider<T:Request> {
    var request:T
    init(_ request:T) {
        self.request = request
    }
    func requestApi(completion: @escaping (T.Response) -> Void,onError: @escaping (Error) -> Void) {
        let baseUrl = self.request.baseURL
        let searchUrl = "\(baseUrl)\(self.request.path)"
        let parameters: [String: Any] = ["q": "\(self.request.keyword)"]
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        AF.request(searchUrl, method: .get, parameters: parameters, encoding: URLEncoding(destination: .queryString), headers: headers).responseJSON { response in
            guard let data = response.data else {
                return
            }
            let json = JSONDecoder()
            do {
                var response:T.Response = try json.decode(T.Response.self, from: data)
                completion(response)
            } catch let error {
                onError(error)
            }
        }
    }
}
