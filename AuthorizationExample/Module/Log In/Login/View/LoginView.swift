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
		
		emailTextField = setupTextfield(placeholder: "Email")
		
		emailTextField.autocapitalizationType = .none
		
		emailTextField.keyboardType = .emailAddress
		
		addSubview(emailTextField)
		
	}
	
	private func setupPasswordTextField() {
		
		passwordTextField = setupTextfield(placeholder: "Password")
		
		passwordTextField.autocapitalizationType = .none
		
		passwordTextField.isSecureTextEntry = true
		
		addSubview(passwordTextField)
		
	}
	
	private func setupTextfield(placeholder: String) -> UITextField {
		
		let textField = UITextField()
		
		textField.translatesAutoresizingMaskIntoConstraints = false
		
		textField.backgroundColor = .hexStringToUIColor(hex: "#1D2D31")
		
		textField.paddingLeftCustom = 10
		
		textField.layer.cornerRadius = 10
		
		textField.textColor = .white
		
		textField.font = .futuraMediumWithSize(17)
		
		let placeholderAttributes = [NSAttributedString.Key.font: UIFont.futuraMediumWithSize(16),
									 NSAttributedString.Key.foregroundColor: UIColor.hexStringToUIColor(hex: "#4D7E8D")]
		
		textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: placeholderAttributes)
		
		return textField
		
	}
	
	private func setupLoginButton() {
		
		loginButton = UIButton(type: .system)
		
		loginButton.translatesAutoresizingMaskIntoConstraints = false
		
		loginButton.isUserInteractionEnabled = false
		
		let attributes = [NSAttributedString.Key.font: UIFont.futuraMediumWithSize(20),
									 NSAttributedString.Key.foregroundColor: UIColor.hexStringToUIColor(hex: "#4D7E8D")]
		
		let title = NSAttributedString(string: "Login", attributes: attributes)
		
		loginButton.setAttributedTitle(title, for: .normal)
		
		loginButton.backgroundColor = .hexStringToUIColor(hex: "#1D2D31")
		
		loginButton.layer.cornerRadius = 10
		
		addSubview(loginButton)
		
	}
	
	// MARK: - SETUP CONSTRAINTS -
	
	private func setupConstraints() {
	
		pinToEdgesWithHeight(48, top: 50, leading: 16, trailing: -16, view: self, subview: emailTextField)

		pinToEdgesWithHeight(48, top: 72, view: emailTextField, subview: passwordTextField)
		
		pinToEdgesWithHeight(48, top: 48+100, leading: 0, trailing: 0, view: passwordTextField, subview: loginButton)
		
	}
	
}
