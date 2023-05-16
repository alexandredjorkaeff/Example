protocol RegisterViewModeling {
    func submit(name: String)
}

final class RegisterViewModel {
    private let router: RegisterRoutingLogic
    private let setUserInformation: SetUserInformationUseCase

    init(
        router: RegisterRoutingLogic,
        setUserInformation: SetUserInformationUseCase
    ) {
        self.router = router
        self.setUserInformation = setUserInformation
    }
}

extension RegisterViewModel: RegisterViewModeling {
    func submit(name: String) {
        setUserInformation.execute(.init(name: name)) { [weak self] _ in
            self?.router.routeToTodoList()
        }
    }
}
