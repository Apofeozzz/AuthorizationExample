//
//  CommentViewController.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 5/3/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {
    
    // MARK: - PRESENTER -
    
    var presenter: CommentPresenterProtocol!
    
    // MARK: - UIVIEW -
    
    var mainView: CommentView!
    
    // MARK: - LIFE CYCLE -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }
    
    // MARK: - ACTION -
    
    @objc private func saveButtonAction() {
        
        presenter.save(comment: mainView.commentTextView.text)
        
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
        
        navBar.tintColor = .appPlaceholderColor()
        
        let attributes = [NSAttributedString.Key.font: UIFont.futuraBoldWithSize(24),
                          NSAttributedString.Key.foregroundColor: UIColor.mainPink()]
        
        let title = NSAttributedString(string: "Add Comment", attributes: attributes)
        
        let navTitleLabel = UILabel()
            
        navTitleLabel.attributedText = title
        
        navigationItem.titleView = navTitleLabel
        
        let saveButton = UIBarButtonItem(title: "Save",
                                         style: .plain,
                                         target: self,
                                         action: #selector(saveButtonAction))
        
        navigationItem.rightBarButtonItem = saveButton
        
    }
    
    private func setupMainView() {
        
        mainView = CommentView()
        
        view.addSubview(mainView)
        
    }
    
    // MARK: - SETUP CONSTRAINTS -
    
    private func setupConstraints() {
        
        view.fillScreenWithSubview(mainView)
        
    }
    
}

extension CommentViewController: CommentViewProtocol { }
