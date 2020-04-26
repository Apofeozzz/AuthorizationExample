//
//  LoginView.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 18.04.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class LoginView: UIView {
	
	// MARK: - UIVIEW -
	
	var emailTextField: UITextField!
	
	var passwordTextField: UITextField!
	
	var loginButton: UIButton!
	
	// MARK: - INIT -
	
	init() {
		
		super.init(frame: .zero)
		
		translatesAutoresizingMaskIntoConstraints = false
		
		setupView()
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - SETUP VIEW -
	
	private func setupView() {
		
		setupEmailTextField()
		
		setupPasswordTextField()
		
		setupLoginButton()
		
		setupConstraints()
		
	}
	
	private func setupEmailTextField() {
		
		emailTextField = UITextField.authTextField(placeholder: "Email")
		
		emailTextField.autocapitalizationType = .none
		
		emailTextField.keyboardType = .emailAddress
		
		addSubview(emailTextField)
		
	}
	
	private func setupPasswordTextField() {
		
        passwordTextField =  UITextField.authTextField(placeholder: "Password")
		
		passwordTextField.autocapitalizationType = .none
		
		passwordTextField.isSecureTextEntry = true
		
		addSubview(passwordTextField)
		
	}
	
	private func setupLoginButton() {
		
        loginButton = UIButton.authButton(title: "Login")
		
		addSubview(loginButton)
		
	}
	
	// MARK: - SETUP CONSTRAINTS -
	
	private func setupConstraints() {
	
		pinToEdgesWithHeight(48, top: 50, leading: 16, trailing: -16, view: self, subview: emailTextField)

		pinToEdgesWithHeight(48, top: 72, view: emailTextField, subview: passwordTextField)
		
		pinToEdgesWithHeight(48, top: 48+100, leading: 0, trailing: 0, view: passwordTextField, subview: loginButton)
		
	}
	
}
