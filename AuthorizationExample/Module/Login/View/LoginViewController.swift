//
//  LoginViewController.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 18.04.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginViewProtocol {
	
	// MARK: - PRESENTER -
	
	var presenter: LoginPresenterProtocol!
    
    var config: LoginConfiguratorProtocol = LoginConfigurator()
	
	// MARK: - UIVIEW -
	
	var mainView: LoginView!
	
	// MARK: - LIFE CYCLE -
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
        
        config.configure(with: self)
        
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
		
		let attributes = [NSAttributedString.Key.font: UIFont.futuraBoldWithSize(24),
						  NSAttributedString.Key.foregroundColor: UIColor.mainPink()]
		
		let title = NSAttributedString(string: "Authorization", attributes: attributes)
		
		let navTitleLabel = UILabel()
		
		navTitleLabel.attributedText = title
		
		navigationItem.titleView = navTitleLabel
		
	}
	
	private func setupMainView() {
		
		mainView = LoginView()
		
		mainView.emailTextField.delegate = self
		mainView.emailTextField.addTarget(self, action: #selector(textFieldDidChangeValue), for: .editingChanged)
		
		mainView.passwordTextField.delegate = self
		mainView.passwordTextField.addTarget(self, action: #selector(textFieldDidChangeValue), for: .editingChanged)
		
		mainView.loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
		
		view.addSubview(mainView)
		
	}
	
	// MARK: - SETUP CONSTRAINTS -
	
	private func setupConstraints() {
		
		view.fillScreenWithSubview(mainView)
		
	}
	
	// MARK: - ACTIONS -
	
	@objc func loginButtonAction() {
		
		presenter.login(email: mainView.emailTextField.text,
						password: mainView.passwordTextField.text)
		
	}
	
	// MARK: - TEXT FIELDS ACTION -
	
	@objc private func textFieldDidChangeValue(_ textField: UITextField) {
		
		checkTextFields()
		
	}
	
	func checkTextFields() {
		
		guard
			let email = mainView.emailTextField.text,
			let password = mainView.passwordTextField.text
			else { return }
		
		if !email.isEmpty && !password.isEmpty && password.count > 5 {
			
			activateLoginButton()
			
		} else { disactivateLoginButton() }
		
	}
	
	func activateLoginButton() {
		
		let attributes = [NSAttributedString.Key.font: UIFont.futuraMediumWithSize(20),
									 NSAttributedString.Key.foregroundColor: UIColor.white]
		
		let title = NSAttributedString(string: "Login", attributes: attributes)
		
		mainView.loginButton.setAttributedTitle(title, for: .normal)
		
		mainView.loginButton.backgroundColor = .mainPink()
		
		mainView.loginButton.isUserInteractionEnabled = true
		
	}
	
	func disactivateLoginButton() {
		
		let attributes = [NSAttributedString.Key.font: UIFont.futuraMediumWithSize(20),
									 NSAttributedString.Key.foregroundColor: UIColor.hexStringToUIColor(hex: "#4D7E8D")]
		
		let title = NSAttributedString(string: "Login", attributes: attributes)
		
		mainView.loginButton.setAttributedTitle(title, for: .normal)
		
		mainView.loginButton.backgroundColor = .hexStringToUIColor(hex: "#1D2D31")
	
		mainView.loginButton.isUserInteractionEnabled = false
		
	}
	
}

extension LoginViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		
		textField.resignFirstResponder()
		
	}
	
}
