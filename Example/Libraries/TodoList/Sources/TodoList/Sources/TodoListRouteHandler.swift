import RouterServiceInterface
import TodoListInterface
import UIKit

public final class TodoListRouteHandler: RouteHandler {
    public let routes: [Route.Type] = [
        TodoListRoute.self
    ]

    public init() {
        
    }
    
    public func destination(forRoute route: Route, fromViewController viewController: UIViewController) -> Feature.Type {
        switch route {
        case is TodoListRoute:
            return TodoListFeature.self
        default:
            preconditionFailure() // unexpected route sent to this handler
        }
    }
}
