//
//  SignInViewController.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/19/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, SignInViewProtocol {
    
    // MARK: - DATA SOURCE -
    
    var presenter: SignInPresenterProtocol!
    
    let config: SignInConfiguratorProtocol = SignInConfigurator()
    
    // MARK: - UIVIEW -
    
    var mainView: SignInView!
    
    // MARK: - LIFE CYCLE -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        config.configure(with: self)
        
    }

    // MARK: - ACTION -
    
    @objc private func signInButtonAction() {
        
        presenter.signIn()
        
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
        
        let title = NSAttributedString(string: "Authorization", attributes: attributes)
        
        let navTitleLabel = UILabel()
        
        navTitleLabel.attributedText = title
        
        navigationItem.titleView = navTitleLabel
        
    }
    
    private func setupMainView() {
        
        mainView = SignInView()
        
        view.addSubview(mainView)
        
        mainView.signInButton.addTarget(self,
                                        action: #selector(signInButtonAction),
                                        for: .touchUpInside)
        
    }
    
    // MARK: - SETUP CONSTRAINTS -
    
    private func setupConstraints() {
        
        view.fillScreenWithSubview(mainView)
        
    }
    
}
