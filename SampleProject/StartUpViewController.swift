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

final class StartUpViewController: UIViewController {
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
        //ApiProvider(GitHubAPI.SearchUsers(keyword: "a")).requestApi()
        let request = GitHubAPI.SearchRepositories(keyword: "aac")
        ApiProvider(request).requestApi(completion: { result in
            print(result.items[0])
            let sb = UIStoryboard(name: "Home", bundle: nil)
            guard let vc = sb.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {
                return
            }
            vc.repo = result.items[0]
            vc.repoData = result.items
            self.navigationController?.pushViewController(vc, animated: true)
        }, onError: { result in
            
        })
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
