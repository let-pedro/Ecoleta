
import Foundation
import UIKit


class InitialCoordinator {
    
    var window: UIWindow
    var View: InitialView
    var ViewController: InitialViewController
    var ViewModel: InitialViewModel
    var homeCoordinator: HomeCoordinator
    
    
    required init(window: UIWindow) {
        self.window = window
        self.View = InitialView()
        self.ViewModel = InitialViewModel()
    }
    
    
    func start() {
        ViewModel.InitialNavigation = self
        ViewController = InitialViewController(view: View)
        window.rootViewController = ViewController
    }
}

extension InitialCoordinator: InitialNavigationsDelegate {
    func InitialToHome(_ viewModel: InitialViewModel) {
        homeCoordinator = HomeCoordinator(window: window)
        homeCoordinator.start(PreviousController: ViewController)
    }
}
