//
//  ApiProvider.swift
//  SampleProject
//
//  Created by kurokawahirokazu on 2020/08/30.
//  Copyright © 2020 kurokawahirokazu. All rights reserved.
//
import Foundation
import Alamofire

class ApiProvider<T:GitHubRequest> {
    var request:T
    var da:SearchResponse<User>?
    
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
            
            var j = JSONDecoder()
            
            do {
                
                
                self.da = try j.decode(SearchResponse<User>.self, from: data)
                
            } catch let error {
                
                print("Error: \(error)")
            }
            print("\(self.da)")
        }
    }
}
