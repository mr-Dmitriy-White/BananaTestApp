
### Answer 1

A navigationController?.pushViewController(vc, animated: true) is adding another VC to the navigation stack. This assumes that VC that originates the push is part of the same navigation controller that the VC that is being added to the stack belongs to. Memory management is not an issue with navigation controllers and a deep stack. As long as you are taking care of objects you might be passing from one VC to another, the runtime will take care of the navigation stack.

A present(vc, animated: true)  is just one VC presenting another VC modally. The VCs don't have to be part of a navigation controller and the VC being presented modally is generally considered to be a "child" of the presenting (parent) VC. The modally presented VC is usually sans any navigation bars or tab bars. The presenting VC is also responsible for dismissing the modal VC it created and presented.

### Answer 2

Keychain Services — When something is sectorial. Authorization keys, for example. UserDefaults - small project settings that do not contain big data. An example is showing the login screen or the main screen of the application (if there is no refresh token in the application), or what theme the user has chosen in the application. Core Data - it's better not to use but replace realm. But why Core Data  or realm needs to be used for complex data structures, arrays, pictures, videos and more.


### Answer 3

Memory leak. [weak self] needs to be written. It also needs to be wrapped in DispatchQueue.main.async. Since most likely self.data has a didSet that updates the data


### Answer 4

 Swift is  protocol oriented programming language first.Often interviews require “strong OOP knowledge” and do not mention a word about POP (swift also has reactive programming, but now is not about that). Protocols are the strongest tool. Examples of using : a. MVC Architecture — if we move the UIView from the controller into a separate class, then by clicking on the button in the UIView inheritor, we need to use Protocol & Delegat (or closure or notification center)  . b. Вarchitectures MVP, VIPER, Clean, all modules communicate through the logger and delegates. As the letter D in SOLID says: upper-level modules should not depend on lower-level modules, and both types of modules should depend on abstractions; the abstractions themselves should not depend on the details, but the details should depend on the abstractions. c. For writing tests. We do not want to make a real request to the network during tests, we want to substitute mock class NetworkingLayer and check the result. And we can only do this thanks to protocols. If we implement to MVP NetworkingLayerProtocol then we can mock the class NetworkingLayerMock: NetworkingLayerProtocol and plug it into our tests.
