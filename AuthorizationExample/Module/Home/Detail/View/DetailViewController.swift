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
    
    var rateCollectionView: UICollectionView!
    
    // MARK: - DATA SOURCE -
    
    var presenter: DetailPresenterProtocol!
    
    // MARK: - LIFE CYCLE -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        presenter.fillRateArrayWithEmptyStars()
        
    }
    
    @objc private func addCommentAction() {
        
        presenter.addCommentAction()
        
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
        
        let comment = UIBarButtonItem(title: "Comment",
                                      style: .done,
                                      target: self,
                                      action: #selector(addCommentAction))
        
        navigationItem.rightBarButtonItem = comment
        
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
        
        return presenter.itemForCell().review.count + 2
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 {
            
            let imageCell = tableView.dequeueReusableCell(withIdentifier: DetailImageTableViewCell.id) as! DetailImageTableViewCell
            
            imageCell.item = presenter.itemForCell()
            
            return imageCell
            
        } else if indexPath.row == 1 {
            
            let rateCell = tableView.dequeueReusableCell(withIdentifier: DetailRateTableViewCell.id) as! DetailRateTableViewCell
            
            rateCollectionView = rateCell.rateCollectionView
            
            rateCell.rateCollectionView.dataSource = self
            
            rateCell.rateCollectionView.delegate = self
            
            rateCell.rateLabel.text = "Rate: \(presenter.itemForCell().rate)"
            
            return rateCell
            
        } else {
            
            let reviewCell = tableView.dequeueReusableCell(withIdentifier: DetailReviewTableViewCell.id) as! DetailReviewTableViewCell
            
            reviewCell.reviewLabel.text = presenter.reviewForCell(indexPath.row)
            
            return reviewCell
            
        }
        
    }
    
    func reloadTableView() {
        
        DispatchQueue.main.async { [weak self] in
            guard let ss = self else { return }
            
            ss.mainView.detailsTableView.reloadData()
            
            ss.rateCollectionView.reloadData()
            
        }
        
    }
    
}

extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RateCollectionViewCell.id,
                                                      for: indexPath) as! RateCollectionViewCell
        
        cell.rateImageView.image = presenter.imageForIndex(indexPath.row)
       
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (UIScreen.main.bounds.width - 50) / 10
        
        return CGSize(width: size, height: size)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        presenter.setupRate(indexPath.row)
        
    }
    
}
