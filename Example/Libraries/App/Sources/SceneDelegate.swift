import LegacyInterface
import RouterService
import RouterServiceInterface
import TodoList
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let store = Store()
    lazy var routerService = RouterService(store: store)

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        routerService.register(
            dependencyFactory: { 
                GetUserInformation(
                    storage: UserDefaults.standard
                )
            },
            forType: GetUserInformationUseCase.self
        )

        routerService.register(
            routeHandler: TodoListRouteHandler()
        )

        let window = UIWindow(windowScene: windowScene)
        let router = RegisterRouter(routerService: routerService)
        let setUserInformation = SetUserInformation(storage: UserDefaults.standard)
        let viewModel = RegisterViewModel(router: router, setUserInformation: setUserInformation)
        let viewController = RegisterViewController(viewModel: viewModel)
        router.viewController = viewController
        window.rootViewController = UINavigationController(rootViewController: viewController)

        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}
