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
    var response:T.Response?
    init(_ request:T) {
        self.request = request
    }
    func requestApi() {
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
                self.response = try json.decode(T.Response.self, from: data)
            } catch let error {
                print("Error: \(error)")
            }
            print("\(self.response)")
        }
    }
}
