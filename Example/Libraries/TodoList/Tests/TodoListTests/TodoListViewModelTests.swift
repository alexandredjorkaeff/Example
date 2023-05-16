import XCTest

@testable import TodoList

final class TodoListTests: XCTestCase {
    private let viewSpy = TodoListDisplayLogicSpy()
    private let getUserInformationSpy = GetUserInformationUseCaseSpy()
    
    private lazy var sut: TodoListViewModel = {
        let sut = TodoListViewModel(getUserInformation: getUserInformationSpy)
        sut.view = viewSpy
        return sut
    }()
    
    func test_load_shouldCallDisplayName() throws {
        let name = "any-name"
        getUserInformationSpy.executeResultToBeReturned = .success(.init(name: name))
        
        sut.load()
        
        XCTAssertTrue(getUserInformationSpy.executeCalled)
        XCTAssertTrue(viewSpy.displayCalled)
        XCTAssertEqual(viewSpy.displayNamePassed, name)
    }
}
