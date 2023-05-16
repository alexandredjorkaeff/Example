import LegacyInterface

protocol TodoListViewModeling {
    func load()
}

final class TodoListViewModel {
    private let getUserInformation: GetUserInformationUseCase

    weak var view: TodoListDisplayLogic?

    init(getUserInformation: GetUserInformationUseCase) {
        self.getUserInformation = getUserInformation
    }
}

extension TodoListViewModel: TodoListViewModeling {
    func load() {
        getUserInformation.execute { [weak self] result in
            switch result {
            case .success(let user):
                self?.view?.display(name: user.name)
            case .failure:
                break
            }
        }
    }
}
