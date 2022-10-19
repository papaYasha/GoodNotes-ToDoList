import SwiftUI

struct SignUp: View {

    @StateObject var viewModel: SignUpViewModel
    
    // MARK: - SIGN UP BODY
    var body: some View {
        VStack {
            Spacer()
            WelcomeText(title: LocalizationConstants.signUpWelcomeTextTitle, message: LocalizationConstants.signUpWelcomeTextMessage)
            CircleProfilePhoto()
            HStack {
                CustomTextFieldForSignUp(viewModel: viewModel)
            }
            .padding(30)
            .padding(.bottom, 50)
            Spacer()
            ActionButtons_SignUpScreen(viewModel: viewModel)
        }
    }
}

struct CircleProfilePhoto: View {
    var body: some View {
        Image(Constants.profilePhoto)
            .resizable()
            .frame(width: 130, height: 130)
            .clipShape(Circle())
            .overlay(Circle()
                        .stroke(Color(Constants.customLightRedColor),
                                lineWidth: 1))
    }
}

struct CustomTextFieldForSignUp: View {
    
    @ObservedObject var viewModel: SignUpViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 17) {
            Text(LocalizationConstants.usernameText)
                .font(Font.custom(Constants.robotoMedium, size: 20))
            TextField(LocalizationConstants.emailAddressPlaceholder, text: $viewModel.login)
                .textCase(.lowercase)
            CustomDivider()
            Text(LocalizationConstants.passwordText)
                .font(Font.custom(Constants.robotoMedium, size: 20))
            TextField(LocalizationConstants.enterYourPasswordPlaceholder, text: $viewModel.password)
                .textCase(.lowercase)
            CustomDivider()
        }
    }
}

// sign up and sign in buttons at the bottom of the screen
struct ActionButtons_SignUpScreen: View {
    
    @ObservedObject var viewModel: SignUpViewModel
    
    var body: some View {
        VStack(spacing: 50) {
            Button {
                viewModel.didTapSignUpButton()
            } label: {
                Text(LocalizationConstants.signUpButtonText)
                    .frame(width: getScreenBounds().width, height: 48, alignment: .center)
                    .padding(.horizontal, -20)
                    .foregroundColor(Color.white)
                    .font(Font.custom(Constants.robotoItalic, size: 18))
                    .background(Color(Constants.customLightRedColor))
            }
            Button {
                viewModel.didTapSignInButton()
            } label: {
                Text(LocalizationConstants.signInButtonText)
                    .padding(.bottom, 40)
                    .foregroundColor(Color(Constants.customLightRedColor))
                    .font(Font.custom(Constants.robotoBoldItalic, size: 18))
            }
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp(viewModel: SignUpViewModel())
    }
}
