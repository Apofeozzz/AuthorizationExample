//
//  SignInView.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/19/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class SignInView: UIView {
    
    // MARK: - UIVIEW -
    
    var topLabel: UILabel!
    
    var orLabel: UILabel!
    
    var continueWithLabel: UILabel!
    
    var signUpButton: UIButton!
    
    var googleSignInButton: UIButton!
    
    var appleSignInButton: UIButton!
    
    var signInStackView: UIStackView!
    
    var signInLabel: UILabel!
    
    var signInButton: UIButton!
    
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
        
        setupTopLabel()
        
        setupSignUpButton()
        
        setupOrLabel()
        
        setupContinueWithLabel()
        
        setupGoogleSignInButton()
        
        setupAppleSignInButton()
        
        setupSignInStackView()
        
        setupConstraints()
        
    }
    
    private func createLabel(text: String) -> UILabel {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = .white
        
        label.font = .futuraMediumWithSize(16)
        
        label.text = text
        
        return label
        
    }
    
    private func setupTopLabel() {
        
        topLabel = createLabel(text: "You need account to continue")
        
        addSubview(topLabel)
        
    }
    
    private func setupOrLabel() {
        
        orLabel = createLabel(text: "OR")
        
        addSubview(orLabel)
        
    }
    
    private func setupContinueWithLabel() {
        
        continueWithLabel = createLabel(text: "Continue with")
        
        addSubview(continueWithLabel)
        
    }
    
    private func setupSignUpButton() {
        
        signUpButton = UIButton(type: .system)
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        signUpButton.backgroundColor = .mainPink()
        
        let attributes = [NSAttributedString.Key.font: UIFont.futuraMediumWithSize(20),
                                     NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let title = NSAttributedString(string: "Sign Up", attributes: attributes)
        
        signUpButton.setAttributedTitle(title, for: .normal)
        
        signUpButton.layer.cornerRadius = 10
        
        addSubview(signUpButton)
        
    }
    
    private func setupGoogleSignInButton() {
        
        googleSignInButton = UIButton(type: .system)
        
        googleSignInButton.translatesAutoresizingMaskIntoConstraints = false
        
        googleSignInButton.layer.cornerRadius = 10
        
        googleSignInButton.layer.borderColor = UIColor.hexStringToUIColor(hex: "#3B5B64").cgColor
        
        googleSignInButton.layer.borderWidth = 1
        
        let attributes = [NSAttributedString.Key.font: UIFont.futuraMediumWithSize(20),
                                     NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let title = NSAttributedString(string: "Google", attributes: attributes)
        
        googleSignInButton.setAttributedTitle(title, for: .normal)
        
        addSubview(googleSignInButton)
        
    }
    
    private func setupAppleSignInButton() {
        
        appleSignInButton = UIButton(type: .system)
        
        appleSignInButton.translatesAutoresizingMaskIntoConstraints = false
        
        appleSignInButton.layer.cornerRadius = 10
        
        appleSignInButton.layer.borderColor = UIColor.hexStringToUIColor(hex: "#3B5B64").cgColor
        
        appleSignInButton.layer.borderWidth = 1
        
        let attributes = [NSAttributedString.Key.font: UIFont.futuraMediumWithSize(20),
                                     NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let title = NSAttributedString(string: "Apple ID", attributes: attributes)
        
        appleSignInButton.setAttributedTitle(title, for: .normal)
        
        addSubview(appleSignInButton)
        
    }
    
    private func setupSignInLabel() {
        
        signInLabel = UILabel()
        
        signInLabel.translatesAutoresizingMaskIntoConstraints = false
        
        signInLabel.textColor = UIColor.hexStringToUIColor(hex: "#9ACDD9")
        
        signInLabel.text = "Already have an account?"
        
        signInLabel.font = .futuraMediumWithSize(14)
        
    }
    
    private func setupSignInButton() {
        
        signInButton = UIButton(type: .system)
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        let attributes = [NSAttributedString.Key.font: UIFont.futuraMediumWithSize(14),
                                     NSAttributedString.Key.foregroundColor: UIColor.mainPink()]
        
        let title = NSAttributedString(string: "Sign in", attributes: attributes)
        
        signInButton.setAttributedTitle(title, for: .normal)
        
    }
    
    private func setupSignInStackView() {
        
        setupSignInLabel()
        
        setupSignInButton()
        
        signInStackView = UIStackView(arrangedSubviews: [signInLabel, signInButton])
        
        signInStackView.translatesAutoresizingMaskIntoConstraints = false
        
        signInStackView.spacing = 5
        
        addSubview(signInStackView)
        
    }
    
    // MARK: - SETUP CONSTRAINTS -
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            topLabel.topAnchor      .constraint(equalTo: topAnchor, constant: 30),
            topLabel.centerXAnchor  .constraint(equalTo: centerXAnchor)
        
        ])
        
        NSLayoutConstraint.activate([
        
            signUpButton.topAnchor      .constraint(equalTo: topLabel.bottomAnchor, constant: 30),
            signUpButton.leadingAnchor  .constraint(equalTo: leadingAnchor, constant: 16),
            signUpButton.trailingAnchor .constraint(equalTo: trailingAnchor, constant: -16),
            signUpButton.heightAnchor   .constraint(equalToConstant: 48)
        
        ])
        
        NSLayoutConstraint.activate([
        
            orLabel.topAnchor       .constraint(equalTo: signUpButton.bottomAnchor, constant: 30),
            orLabel.centerXAnchor   .constraint(equalTo: centerXAnchor)
        
        ])
        
        NSLayoutConstraint.activate([
        
            continueWithLabel.topAnchor     .constraint(equalTo: orLabel.bottomAnchor, constant: 30),
            continueWithLabel.centerXAnchor .constraint(equalTo: centerXAnchor)
        
        ])
        
        NSLayoutConstraint.activate([
        
            googleSignInButton.topAnchor        .constraint(equalTo: continueWithLabel.bottomAnchor, constant: 30),
            googleSignInButton.leadingAnchor    .constraint(equalTo: signUpButton.leadingAnchor),
            googleSignInButton.trailingAnchor   .constraint(equalTo: signUpButton.trailingAnchor),
            googleSignInButton.heightAnchor     .constraint(equalTo: signUpButton.heightAnchor)
        
        ])
        
        NSLayoutConstraint.activate([
        
            appleSignInButton.topAnchor     .constraint(equalTo: googleSignInButton.bottomAnchor, constant: 30),
            appleSignInButton.leadingAnchor .constraint(equalTo: signUpButton.leadingAnchor),
            appleSignInButton.trailingAnchor.constraint(equalTo: signUpButton.trailingAnchor),
            appleSignInButton.heightAnchor  .constraint(equalTo: signUpButton.heightAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
        
            signInStackView.bottomAnchor    .constraint(equalTo: bottomAnchor, constant: -30),
            signInStackView.centerXAnchor   .constraint(equalTo: centerXAnchor)
        
        ])
        
    }
    
}
