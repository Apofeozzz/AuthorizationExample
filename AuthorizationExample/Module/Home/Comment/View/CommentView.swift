//
//  CommentView.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 5/3/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class CommentView: UIView, CommentLayoutProtocol {
    
    // MARK: - UIVIEW -
    
    var titleLabel:         UILabel!
    
    var titleTextField:     UITextField!
    
    var commentLabel:       UILabel!
    
    var commentTextView:    UITextView!
    
    // MARK: - INIT -
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("CommentView deinit")
    }
    
    // MARK: - SETUP VIEW -
    
    private func setupView() {
        
        setupTitleLabel()
        
        setupTitleTextField()
        
        setupCommentLabel()
        
        setupCommentTextView()
        
        setupConstraints()
        
    }
    
    private func setupTitleLabel() {
        
        titleLabel = UILabel()
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textColor = .appPlaceholderColor()
        
        titleLabel.font = .futuraMediumWithSize(17)
        
        titleLabel.text = "Title"
        
        addSubview(titleLabel)
        
    }
    
    private func setupTitleTextField() {
        
        titleTextField = UITextField.authTextField(placeholder: "Please enter title")
        
        titleTextField.layer.borderColor = UIColor.appPlaceholderColor().cgColor
        
        titleTextField.layer.borderWidth = 1
        
        addSubview(titleTextField)
        
    }
    
    private func setupCommentLabel() {
        
        commentLabel = UILabel()
        
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        commentLabel.textColor = .appPlaceholderColor()
        
        commentLabel.font = .futuraMediumWithSize(17)
        
        commentLabel.text = "Description"
        
        addSubview(commentLabel)
        
    }
    
    private func setupCommentTextView() {
        
        commentTextView = UITextView()
        
        commentTextView.translatesAutoresizingMaskIntoConstraints = false
        
        commentTextView.backgroundColor = .hexStringToUIColor(hex: "#1D2D31")
        
        commentTextView.font = .futuraMediumWithSize(16)
        
        commentTextView.textColor = .white
        
        commentTextView.layer.cornerRadius = 10
        
        commentTextView.layer.borderColor = UIColor.appPlaceholderColor().cgColor
        
        commentTextView.layer.borderWidth = 1
        
        addSubview(commentTextView)
        
    }
    
    // MARK: - SETUP CONSTRAINTS -
    
    private func setupConstraints() {
     
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor    .constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40)
            
        ])
        
        NSLayoutConstraint.activate([
        
            titleTextField.topAnchor        .constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            titleTextField.leadingAnchor    .constraint(equalTo: leadingAnchor, constant: 20),
            titleTextField.trailingAnchor   .constraint(equalTo: trailingAnchor, constant: -20),
            titleTextField.heightAnchor     .constraint(equalToConstant: 40)
        
        ])
        
        NSLayoutConstraint.activate([
        
            commentLabel.topAnchor      .constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            commentLabel.leadingAnchor  .constraint(equalTo: titleLabel.leadingAnchor)
        
        ])
        
        NSLayoutConstraint.activate([
        
            commentTextView.topAnchor       .constraint(equalTo: commentLabel.bottomAnchor, constant: 5),
            commentTextView.leadingAnchor   .constraint(equalTo: leadingAnchor, constant: 20),
            commentTextView.trailingAnchor  .constraint(equalTo: trailingAnchor, constant: -20),
            commentTextView.heightAnchor    .constraint(equalToConstant: UIScreen.main.bounds.height / 4)
        
        ])
        
    }
    
}
