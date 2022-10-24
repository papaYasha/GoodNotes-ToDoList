import SwiftUI

struct SignIn: View {
    
    @StateObject var viewModel: SignInViewModel
    
    var body: some View {
        VStack {
            LeftArrow()
            Spacer()
            HStack {
                WelcomeText(title: LocalizationConstants.signInWelcomeTextTitle, message: LocalizationConstants.signInWelcomeTextMessage)
                Spacer()
            }
            HStack {
                CustomTextFieldSignIn(viewModel: viewModel)
            }

            HStack {
                Spacer()
                ForgotPasswordButton(viewModel: viewModel)
            } .padding(.trailing, 35)
            Spacer()
            HStack {
                SignInSignUpButtons(viewModel: viewModel)
            }
        }
    }
}

struct ForgotPasswordButton: View {
    
    @ObservedObject var viewModel: SignInViewModel
    
    var body: some View {
        Button {
            viewModel.didTapForgotPasswordButton()
        } label: {
            Text(LocalizationConstants.signInForgotPasswordButtonText)
                .foregroundColor(Color(Constants.customLightBlackColor))
                .font(Font.custom(Constants.robotoThinItalic, size: 18))
        }
    }
}

struct CustomTextFieldSignIn: View {
    
    @ObservedObject var viewModel: SignInViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 17) {
            Text(LocalizationConstants.usernameText)
                .font(Font.custom(Constants.robotoMedium, size: 20))
            TextField(LocalizationConstants.emailAddressPlaceholder, text: $viewModel.login)
            CustomDivider()
            Text(LocalizationConstants.passwordText)
                .font(Font.custom(Constants.robotoMedium, size: 20))
            TextField(LocalizationConstants.enterYourPasswordPlaceholder, text: $viewModel.password)
            CustomDivider()
        }
            .padding([.top, .leading, .trailing], 24.0)
    }
}

struct SignInSignUpButtons: View {
    
    @ObservedObject var viewModel: SignInViewModel
    
    var body: some View {
        VStack(spacing: 130) {
            Button {
                viewModel.didTapSignInButton()
            } label: {
                Text(LocalizationConstants.signInButtonText)
                    .frame(width: getScreenBounds().width, height: 48, alignment: .center)
                    .padding(.horizontal, -20)
                    .foregroundColor(Color.white)
                    .font(Font.custom(Constants.robotoItalic, size: 18))
                    .background(Color(Constants.customLightRedColor))
            }
                .padding()
            Button {
                viewModel.didTapSignUpButton()
            } label: {
                Text(LocalizationConstants.signUpButtonText)
                    .padding(.bottom, 40)
                    .foregroundColor(Color(Constants.customLightRedColor))
                    .font(Font.custom(Constants.robotoBoldItalic, size: 18))
            }
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn(viewModel: SignInViewModel())
    }
}
