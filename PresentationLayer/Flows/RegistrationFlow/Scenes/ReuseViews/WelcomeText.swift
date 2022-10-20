import SwiftUI

struct WelcomeText: View {
    
    @State var title: String
    @State var message: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.custom(Constants.robotoItalic, size: 32))
                .foregroundColor(Color(Constants.customLightBlackColor))
            Text(message)
                .font(.custom(Constants.robotoMedium, size: 16))
                .foregroundColor(Color(Constants.customLightGrayColor))
        }.padding(25)
    }
}
