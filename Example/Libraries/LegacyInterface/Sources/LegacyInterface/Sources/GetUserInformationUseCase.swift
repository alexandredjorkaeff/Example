public protocol GetUserInformationUseCase {
    func execute(completionHandler: @escaping (Result<UserInformation, Error>) -> Void)
}
