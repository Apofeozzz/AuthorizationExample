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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        mainView.vineTableView.reloadData()
        
    }
    
    // MARK: - ACTION -
    
    @objc private func signOutAction() {
        
        presenter.signOut()
        
    }
    
    @objc private func addButtonAction() {
        
        presenter.add()
        
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
        
        let title = NSAttributedString(string: "Home Screen", attributes: attributes)
        
        let navTitleLabel = UILabel()
        
        navTitleLabel.attributedText = title
        
        navigationItem.titleView = navTitleLabel
        
        let signOutButton = UIBarButtonItem(title: "Sign Out",
                                            style: .plain,
                                            target: self,
                                            action: #selector(signOutAction))
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add,
                                        target: self,
                                        action: #selector(addButtonAction))
        
        navigationItem.leftBarButtonItem = signOutButton
        
        navigationItem.rightBarButtonItem = addButton
        
    }
    
    private func setupMainView() {
        
        mainView = HomeView()
        
        mainView.vineTableView.dataSource = self
        
        mainView.vineTableView.delegate = self
        
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

// MARK: - UITABLEVIEW DELEGATE -

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.numberOfRows()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewCell.identifier, for: indexPath) as! HomeViewCell
            
        cell.vine = presenter.dataForRow(indexPath.row)

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        presenter.selectItem(indexPath.row)
    }
    
    func reloadTableView() {
        
        DispatchQueue.main.async { [weak self] in
            
            guard let ss = self else { return }
            
            ss.mainView.vineTableView.reloadData()
            
        }
        
    }
    
}
