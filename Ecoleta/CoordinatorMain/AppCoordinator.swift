
import Foundation
import UIKit

class AppCoordinator {
    
    var window: UIWindow
    var initialCoordinator: InitialCoordinator?

    
    required init(window: UIWindow) {
        self.window = window
        self.window.makeKeyAndVisible()
    }
    
    func start() {
        initialCoordinator = InitialCoordinator(window: window)
        initialCoordinator?.start()
    }
}
