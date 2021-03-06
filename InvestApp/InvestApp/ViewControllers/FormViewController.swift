//
//  SendContactViewController.swift
//  InvestApp
//
//  Created by Victor tavares on 06/06/2018.
//  Copyright © 2018 Santander. All rights reserved.
//

import UIKit
import RxSwift

class FormViewController: UIViewController {
    
    let viewModel = FormViewModel()

    var viewCreator: FormViewCreator?

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.setupObservables()
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let formData = viewModel.formData.value {
            self.loadFormView(formData)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setUpUI() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func loadFormView(_ formData: FormData) {
        self.view.subviews.forEach{$0.removeFromSuperview()}
        self.viewCreator = FormViewCreator(rootView: self.view, context: self.viewModel)
        _ = self.viewCreator?.visit(node: formData)
    }

    func setupObservables() {
        viewModel.disposeBag = self.disposeBag
        viewModel.formData.asObservable().subscribe(onNext: { (formData) in
            if let formData = formData {
                self.loadFormView(formData)
            }
        }).disposed(by: disposeBag)

        viewModel.formCurrentState.asObservable().subscribe(onNext: { state in
            if state.state == FormState.afterValidate && state.error == nil {
                self.performSegue(withIdentifier: "sendMessageWithSuccess", sender: nil)
            }
        }).disposed(by: disposeBag)
    }
    
}
