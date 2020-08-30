//
//  ApiProvider.swift
//  SampleProject
//
//  Created by kurokawahirokazu on 2020/08/30.
//  Copyright © 2020 kurokawahirokazu. All rights reserved.
//

import Alamofire

class ApiProvider {
    static func requestApi() {
        let baseUrl = "http://zipcloud.ibsnet.co.jp/api/"
        let searchUrl = "\(baseUrl)search"
        let parameters: [String: Any] = ["zipcode": "2790031"]
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        AF.request(searchUrl, method: .get, parameters: parameters, encoding: URLEncoding(destination: .queryString), headers: headers).responseJSON { response in
            guard let data = response.data else {
                return
            }
            print(response)
        }
    }
}
