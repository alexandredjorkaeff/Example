import LegacyInterface

final class GetUserInformationUseCaseSpy: GetUserInformationUseCase {
    private(set) var executeCalled: Bool = false
    var executeResultToBeReturned: Result<UserInformation, Error>?
    
    func execute(completionHandler: @escaping (Result<UserInformation, Error>) -> Void) {
        executeCalled = true
        if let executeResultToBeReturned {
            completionHandler(executeResultToBeReturned)
        }
    }
}
