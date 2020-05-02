//
//  DetailViewController.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 5/2/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - UIVIEW -
    
    var mainView: DetailLayoutProtocol!
    
    // MARK: - DATA SOURCE -
    
    var presenter: DetailPresenterProtocol!
    
    // MARK: - LIFE CYCLE -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
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
        
        let title = NSAttributedString(string: presenter.navigationTitle(), attributes: attributes)
        
        let navTitleLabel = UILabel()
            
        navTitleLabel.attributedText = title
        
        navigationItem.titleView = navTitleLabel
        
    }
    
    private func setupMainView() {
        
        mainView = DetailView()
        
        mainView.detailsTableView.dataSource = self
        
        mainView.detailsTableView.delegate = self
        
        view.addSubview(mainView)
        
    }
    
    private func setupConstraints() {
        
        view.fillScreenWithSubview(mainView)
        
    }
    
}

extension DetailViewController: DetailViewProtocol {}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let imageCell = tableView.dequeueReusableCell(withIdentifier: DetailImageViewCell.id) as! DetailImageViewCell
        
        imageCell.item = presenter.itemForCell()
        
        return imageCell
        
    }
    
}
