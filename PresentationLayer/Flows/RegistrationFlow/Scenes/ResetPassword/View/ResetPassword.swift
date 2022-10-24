import SwiftUI

struct ResetPassword: View {
    
    @StateObject var viewModel: ResetPasswordViewModel
        
    var body: some View {
        VStack {
            LeftArrow()
                .padding(.bottom, 50)
                .padding(.top)
            HStack {
                WelcomeText(title: LocalizationConstants.resetPasswordTitle, message: LocalizationConstants.resetPasswordMessage)
                Spacer()
            }
            ResetPasswordTextFields()
                .padding(24.0)
            ChangePasswordButton(viewModel: viewModel)
                .padding(.top, 50.0)
            Spacer()
        }
    }
}

struct ResetPasswordTextFields: View {

    @State var code: String = ""
    @State var newPassword = ""
    @State var confirmPassword = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 17) {
            Text(LocalizationConstants.resetCodeText)
                .font(Font.custom(Constants.robotoMedium, size: 20))
            TextField(LocalizationConstants.enterYourCodePlaceholder, text: $code)
            CustomDivider()
            Text(LocalizationConstants.newPasswordText)
                .font(Font.custom(Constants.robotoMedium, size: 20))
            TextField(LocalizationConstants.enterYourPasswordPlaceholder, text: $newPassword)
            CustomDivider()
            Text(LocalizationConstants.confirmPasswordText)
                .font(Font.custom(Constants.robotoMedium, size: 20))
            TextField(LocalizationConstants.confirmPasswordPlaceholder, text: $confirmPassword)
            CustomDivider()
        }
    }
}

struct ChangePasswordButton: View {
    
    @ObservedObject var viewModel: ResetPasswordViewModel
    
    var body: some View {
        Button {
            viewModel.changePasswordButtonTapped()
        } label: {
            Text(LocalizationConstants.changePasswordText)
                .frame(width: getScreenBounds().width, height: 48, alignment: .center)
                .padding(.horizontal, -20)
                .foregroundColor(Color.white)
                .font(Font.custom(Constants.robotoItalic, size: 18))
                .background(Color(Constants.customLightRedColor))
        }
    }
}

struct ResetPassword_Previews: PreviewProvider {
    static var previews: some View {
        ResetPassword(viewModel: ResetPasswordViewModel())
    }
}
