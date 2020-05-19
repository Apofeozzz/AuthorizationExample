//
//  SignUpView.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/25/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class SignUpView: UIView, SignUpViewLayout {
    
    // MARK: - UIVIEW -
    
    var scrollView: UIScrollView!
    
    var contentScrollView: UIView!
    
    var emailTextField: UITextField!
    
    var passwordTextField: UITextField!
    
    var confirmPasswordTextField: UITextField!
    
    var signUpButton: UIButton!
    
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
        
        setupScrollView()
        
        setupConstraints()
        
    }
    
    private func setupScrollView() {
        
        scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(scrollView)
        
        setupContentScrollView()
        
    }
    
    private func setupContentScrollView() {
        
        contentScrollView =  UIView()
        
        contentScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(contentScrollView)
        
        setupEmailTextField()
        
        setupPasswordTextField()
        
        setupConfirmPasswordTextField()
        
        setupSignUpButton()
        
    }
    
    private func setupEmailTextField() {
        
        emailTextField = UITextField.authTextField(placeholder: "Email")
        
        contentScrollView.addSubview(emailTextField)
        
    }
    
    private func setupPasswordTextField() {
        
        passwordTextField = UITextField.authTextField(placeholder: "Password")
        
        passwordTextField.isSecureTextEntry = true
        
        contentScrollView.addSubview(passwordTextField)
        
    }
    
    private func setupConfirmPasswordTextField() {
        
        confirmPasswordTextField = UITextField.authTextField(placeholder: "Confirm password")
        
        confirmPasswordTextField.isSecureTextEntry = true
        
        contentScrollView.addSubview(confirmPasswordTextField)
        
    }
    
    private func setupSignUpButton() {
        
        signUpButton = UIButton.authButton(title: "Sign Up")
        
        contentScrollView.addSubview(signUpButton)
        
    }
    
    // MARK: - SETUP CONSTRAINTS -
    
    private func setupConstraints() {
    
        fillScreenWithSubview(scrollView)
        
        NSLayoutConstraint.activate([
            
            contentScrollView.topAnchor     .constraint(equalTo: scrollView.topAnchor),
            contentScrollView.leadingAnchor .constraint(equalTo: scrollView.leadingAnchor),
            contentScrollView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentScrollView.bottomAnchor  .constraint(equalTo: scrollView.bottomAnchor),
        
            contentScrollView.widthAnchor   .constraint(equalToConstant: UIScreen.main.bounds.width),
            contentScrollView.heightAnchor  .constraint(equalToConstant: 500)
        
        ])
        
        pinToEdgesWithHeight(48, top: 50, leading: 16, trailing: -16, view: self, subview: emailTextField)

        pinToEdgesWithHeight(48, top: 72, view: emailTextField, subview: passwordTextField)
        
        pinToEdgesWithHeight(48, top: 72, view: passwordTextField, subview: confirmPasswordTextField)
        
        pinToEdgesWithHeight(48, top: 48+100, view: confirmPasswordTextField, subview: signUpButton)
        
    }
    
}
