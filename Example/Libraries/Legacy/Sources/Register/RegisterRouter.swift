import RouterServiceInterface
import TodoListInterface
import UIKit

protocol RegisterRoutingLogic {
    func routeToTodoList()
}

final class RegisterRouter {
    private let routerService: RouterServiceProtocol

    weak var viewController: UIViewController?

    init(routerService: RouterServiceProtocol) {
        self.routerService = routerService
    }
}

extension RegisterRouter: RegisterRoutingLogic {
    func routeToTodoList() {
        guard let viewController = viewController else {
            return
        }
        
        routerService.navigate(
            toRoute: TodoListRoute(),
            fromView: viewController,
            presentationStyle: Push(),
            animated: true
        )
    }
}
