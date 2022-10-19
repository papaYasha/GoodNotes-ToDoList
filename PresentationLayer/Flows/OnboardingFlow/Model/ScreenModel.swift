import Foundation

struct BoardingScreen: Identifiable {
    var id = UUID().uuidString
    var contentImage: String
    var title: String
    var message: String
}

// Sample model screen

var boardingScreens: [BoardingScreen] = [
    BoardingScreen(contentImage: Constants.firstScreenContentImageName,
                   title: LocalizationConstants.firstScreenTitle,
                   message: LocalizationConstants.firstScreenMessage),
    
    BoardingScreen(contentImage: Constants.secondScreenContentImageName,
                   title: LocalizationConstants.secondScreenTitle,
                   message: LocalizationConstants.secondScreenMessage),
    
    BoardingScreen(contentImage: Constants.thirdScreenContentImageName,
                   title: LocalizationConstants.thirdScreenTitle,
                   message: LocalizationConstants.thirdScreenMessage)
]
