//
//  LaunchViewController.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 18.04.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController, LaunchViewProtocol {
	
	// MARK: - PRESENTER -
    
    let configurator: LaunchConfiguratorProtocol = LaunchConfigurator()
	
	var presenter: LaunchViewPresenterProtocol!
	
	// MARK: - UIVIEW -
	
	var mainView: LaunchView!
	
	// MARK: - LIFE CYCLE -
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
        
        configurator.configure(with: self)
		
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(true)
		
		presenter.checkLoggedUser()
		
	}
	
	// MARK: - SETUP VIEW -
	
	private func setupView() {
		
		view.backgroundColor = .mainGreen()
		
		setupMainView()
		
		setupConstraints()
		
	}
	
	private func setupMainView() {
		
		mainView = LaunchView()
		
		view.addSubview(mainView)
		
	}
	
	// MARK: - SETUP CONSTRAINTS -
	
	private func setupConstraints() {
		
		view.fillScreenWithSubview(mainView)
		
	}
	
}
