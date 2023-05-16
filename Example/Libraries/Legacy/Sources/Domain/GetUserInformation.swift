import LegacyInterface

enum GetUserInformationError: Error {
    case noValue
}

final class GetUserInformation {
    private let storage: Storage

    init(storage: Storage) {
        self.storage = storage
    }
}

extension GetUserInformation: GetUserInformationUseCase {
    func execute(completionHandler: @escaping (Result<UserInformation, Error>) -> Void) {
        guard let name = storage.string(forKey: "name") else {
            completionHandler(.failure(GetUserInformationError.noValue))
            return
        }
        
        completionHandler(.success(.init(name: name)))
    }
}
