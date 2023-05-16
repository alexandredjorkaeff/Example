import LegacyInterface

protocol SetUserInformationUseCase {
    func execute(_ user: UserInformation, completionHandler: @escaping (Result<Void, Never>) -> Void)
}

final class SetUserInformation {
    private let storage: Storage

    init(storage: Storage) {
        self.storage = storage
    }
}

extension SetUserInformation: SetUserInformationUseCase {
    func execute(_ user: UserInformation, completionHandler: @escaping (Result<Void, Never>) -> Void) {
        storage.set(user.name, forKey: "name")
        completionHandler(.success(()))
    }
}
