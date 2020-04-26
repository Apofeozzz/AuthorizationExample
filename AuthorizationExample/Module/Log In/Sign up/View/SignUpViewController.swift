//
//  SignUpViewController.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/25/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

protocol SignUpViewLayout: UIView {
    
    var signUpButton: UIButton! { get set }
    
    var emailTextField: UITextField! { set get }
    
    var passwordTextField: UITextField! { set get }
    
    var confirmPasswordTextField: UITextField! { set get }
    
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
    
    // MARK: - ACTION -
    
    @objc private func signUpButtonAction() {
        
        presenter.signUp(email: mainView.emailTextField.text,
                         password: mainView.passwordTextField.text)
        
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
        
        mainView.emailTextField.delegate = self
        
        mainView.passwordTextField.delegate = self
        
        mainView.confirmPasswordTextField.delegate = self
        
        mainView.emailTextField.addTarget(self,
                                          action: #selector(textFieldValueDidChange),
                                          for: .editingChanged)
        
        mainView.passwordTextField.addTarget(self,
                                             action: #selector(textFieldValueDidChange),
                                             for: .editingChanged)
        
        mainView.confirmPasswordTextField.addTarget(self,
                                                    action: #selector(textFieldValueDidChange),
                                                    for: .editingChanged)
        
        mainView.signUpButton.addTarget(self,
                                        action: #selector(signUpButtonAction),
                                        for: .touchUpInside)
        
        view.addSubview(mainView)
        
    }
    
    // MARK: - SETUP CONSTRAINTS -
    
    private func setupConstraints() {
        
        view.fillScreenWithSubview(mainView)
        
    }
    
}

extension SignUpViewController: SignUpViewProtocol {
    
    func activateSignUpButton() {
        
        let attributes = [NSAttributedString.Key.font: UIFont.futuraMediumWithSize(20),
                                     NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let title = NSAttributedString(string: "Sign Up", attributes: attributes)
        
        mainView.signUpButton.setAttributedTitle(title, for: .normal)
        
        mainView.signUpButton.backgroundColor = .mainPink()
        
        mainView.signUpButton.isUserInteractionEnabled = true
        
    }
    
    func disactivateSignUpButton() {
        
        let attributes = [NSAttributedString.Key.font: UIFont.futuraMediumWithSize(20),
                                     NSAttributedString.Key.foregroundColor: UIColor.hexStringToUIColor(hex: "#4D7E8D")]
        
        let title = NSAttributedString(string: "Sign Up", attributes: attributes)
        
        mainView.signUpButton.setAttributedTitle(title, for: .normal)
        
        mainView.signUpButton.backgroundColor = .hexStringToUIColor(hex: "#1D2D31")
    
        mainView.signUpButton.isUserInteractionEnabled = false
        
    }
    
}

extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
    }
    
    @objc private func textFieldValueDidChange() {
        
        presenter.checkTextFields(email: mainView.emailTextField.text,
                                  password: mainView.passwordTextField.text,
                                  confirmation: mainView.confirmPasswordTextField.text)
        
    }
    
}
