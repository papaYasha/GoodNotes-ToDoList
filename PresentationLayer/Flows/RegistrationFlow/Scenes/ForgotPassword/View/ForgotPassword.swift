import SwiftUI

struct ForgotPassword: View {
    
    @StateObject var viewModel: ForgotPasswordViewModel
    
    @State var username = ""
    
    var body: some View {
        VStack {
            LeftArrow()
            HStack {
                WelcomeText(title: LocalizationConstants.forgotPasswordTitle, message: LocalizationConstants.forgotPasswordMessage)
                Spacer()
            }
            .padding(.top, 100.0)
            VStack(alignment: .leading) {
                Text(LocalizationConstants.usernameText)
                    .font(Font.custom(Constants.robotoMedium, size: 20))
                TextField(LocalizationConstants.emailAddressPlaceholder, text: $username)
                CustomDivider()
                SendRequestButton(viewModel: viewModel)
                    .padding(.top, 30.0)
            }
            .padding(.horizontal, 24.0)
            Spacer()
        }
    }
}

struct SendRequestButton: View {
    
    @ObservedObject var viewModel: ForgotPasswordViewModel
    
    var body: some View {
        Button {
            viewModel.didTapSendRequestButton()
        } label: {
            Text(LocalizationConstants.sendRequestText)
                .frame(width: getScreenBounds().width, height: 48, alignment: .center)
                .padding(.horizontal, -20)
                .foregroundColor(.white)
                .font(Font.custom(Constants.robotoItalic, size: 20))
                .background(Color(Constants.customLightRedColor))
        }
    }
}
