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
    
    var signUpLabel: UILabel!
    
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
        
    }
    
}
