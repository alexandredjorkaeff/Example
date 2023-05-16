@testable import TodoList

final class TodoListDisplayLogicSpy: TodoListDisplayLogic {
    private(set) var displayCalled: Bool = false
    private(set) var displayNamePassed: String?
    
    func display(name: String) {
        displayCalled = true
        displayNamePassed = name
    }
}
