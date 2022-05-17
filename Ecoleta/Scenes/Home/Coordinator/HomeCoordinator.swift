//
//  HomeCoordinator.swift
//  Ecoleta
//
//  Created by Development IOS on 16/05/22.
//

import Foundation
import UIKit



class HomeCoordinator {
    
    var window: UIWindow
    var View: InitialView
    var ViewController: InitialViewController
    var ViewModel: InitialViewModel?

    
    //var loginCoordinator: LoginCoordinator?
    
    let initialCoordinator: InitialCoordinator
    
    required init(window: UIWindow) {
        self.window = window
        self.View = InitialView()
        self.ViewModel = InitialViewModel()
    }
    
    
    func start(PreviousController: UIViewController) {
        
        
        ViewModel?.InitialNavigation = self
        ViewController = InitialViewController(view: View!, viewModel: ViewModel!)
        window.rootViewController = ViewController
    }
}

extension InitialCoordinator: InitialNavigationsDelegate {
    func InitialViewGoToLogin(_ viewModel: InitialViewModel) {
        loginCoordinator = LoginCoordinator(window: window)
        loginCoordinator?.start(PreviousController: ViewController!)
    }

}
