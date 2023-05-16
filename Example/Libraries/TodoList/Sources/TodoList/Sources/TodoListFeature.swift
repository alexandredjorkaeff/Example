import LegacyInterface
import RouterServiceInterface
import UIKit

struct TodoListFeature: Feature {
    @Dependency var getUserInformation: GetUserInformationUseCase

    func build(fromRoute route: Route?) -> UIViewController {
        let viewModel = TodoListViewModel(getUserInformation: getUserInformation)
        let viewController = TodoListViewController(viewModel: viewModel)
        viewModel.view = viewController
        return viewController
    }
}
