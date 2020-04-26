//
//  HomeViewController.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/24/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - PRESENTER -
    
    var presenter: HomePresenterProtocol!
    
    // MARK: - UIVIEW -
    
    var mainView: HomeView!
    
    // MARK: - LIFE CYCLE -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }
    
    // MARK: - ACTION -
    
    @objc private func signOutAction() {
        
        presenter.signOut()
        
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
        
        let title = NSAttributedString(string: "Home Screen", attributes: attributes)
        
        let navTitleLabel = UILabel()
        
        navTitleLabel.attributedText = title
        
        navigationItem.titleView = navTitleLabel
        
        let signOutButton = UIBarButtonItem(title: "Sign Out",
                                            style: .plain,
                                            target: self,
                                            action: #selector(signOutAction))
        
        navigationItem.leftBarButtonItem = signOutButton
        
    }
    
    private func setupMainView() {
        
        mainView = HomeView()
        
        view.addSubview(mainView)
        
    }
    
    // MARK: - SETUP CONSTRAINTS -
    
    private func setupConstraints() {
        
        view.fillScreenWithSubview(mainView)
        
    }
    
}

// MARK: - HOME VIEW PROTOCOL -

extension HomeViewController: HomeViewProtocol {
    
}
