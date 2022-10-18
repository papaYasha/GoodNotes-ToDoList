import Foundation

struct BoardingScreen: Identifiable {
    var id = UUID().uuidString
    var contentImage: String
    var title: String
    var message: String
}

// Sample model screen

var boardingScreens: [BoardingScreen] = [
    BoardingScreen(contentImage: Constants.firstScreenContentImageName, title: Constants.firstScreenTitle, message: Constants.firstScreenMessage),
    BoardingScreen(contentImage: Constants.secondScreenContentImageName, title: Constants.secondScreenTitle, message: Constants.secondScreenMessage),
    BoardingScreen(contentImage: Constants.thirdScreenContentImageName, title: Constants.thirdScreenTitle, message: Constants.thirdScreenMessage)
]
