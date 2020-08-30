//
//  StartUpViewController.swift
//  SampleProject
//
//  Created by kurokawahirokazu on 2020/08/30.
//  Copyright © 2020 kurokawahirokazu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire

class StartUpViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginButton.rx.tap
        .subscribe { [unowned self] _ in
            self.login()
        }
        .disposed(by: disposeBag)
        
    }
    
    private func login() {
        let baseUrl = "http://zipcloud.ibsnet.co.jp/api/"
        let searchUrl = "\(baseUrl)search"
        let parameters: [String: Any] = ["zipcode": "2790031"]
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        
        AF.request(searchUrl, method: .get, parameters: parameters, encoding: URLEncoding(destination: .queryString), headers: headers).responseJSON { response in
            guard let data = response.data else {
                return
            }
            print(response)
//            do {
//                self.addresses = try JSONDecoder().decode(AddressModel.self, from: data)
//            } catch let error {
//                print("Error: \(error)")
//            }
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
