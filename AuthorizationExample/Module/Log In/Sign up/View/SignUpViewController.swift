//
//  SignUpViewController.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/25/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

protocol SignUpViewLayout: UIView {
    
}

class SignUpViewController: UIViewController {
    
    // MARK: - PRESENTER -
    
    weak var presenter: SignUpPresenterProtocol!
    
    // MARK: - UIVEW -
    
    var mainView: SignUpViewLayout!
    
    // MARK: - LIFE CYCLE -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }
    
    // MARK: - SETUP VIEW -
    
    private func setupView() {
        
        view.backgroundColor = .mainGreen()
        
        setupNavigationBar()
        
        setupMainView()
        
        setupConstraints()
        
    }
    
    private func setupNavigationBar() {
        
        guard let navBar = navigationController?.navigationBar else { return }
        
        navBar.isTranslucent = false
        navBar.barTintColor = .mainGreen()
        navBar.tintColor = UIColor.hexStringToUIColor(hex: "#4D7E8D")
        
        let attributes = [NSAttributedString.Key.font: UIFont.futuraBoldWithSize(24),
                          NSAttributedString.Key.foregroundColor: UIColor.mainPink()]
        
        let title = NSAttributedString(string: "Sign Up", attributes: attributes)
        
        let navTitleLabel = UILabel()
        navTitleLabel.attributedText = title
        
        navigationItem.titleView = navTitleLabel
        
    }
    
    private func setupMainView() {
        
        mainView = SignUpView()
        
        view.addSubview(mainView)
        
    }
    
    // MARK: - SETUP CONSTRAINTS -
    
    private func setupConstraints() {
        view.fillScreenWithSubview(mainView)
    }
    
}

extension SignUpViewController: SignUpViewProtocol {
    
}
