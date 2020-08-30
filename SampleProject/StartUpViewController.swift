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
    private let disposeBag = DisposeBag()
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
        ApiProvider(GitHubAPI.SearchUsers(keyword: "test")).requestApi()
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
