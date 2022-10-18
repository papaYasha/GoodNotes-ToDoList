//import SwiftUI
//
//struct SignUp: View {
//
//    @StateObject var viewModel: SignUpViewModel
//       
//    var header: some View {
//        HStack {
//            WelcomeText(title: Constants.welcomeSignUpTextTitle, message: Constants.welcomeSignUpTextMessage)
//            Spacer()
//        }
//    }
//    
//    // MARK: - SIGN UP BODY
//    var body: some View {
//        VStack {
//            Spacer()
//            header
//            CircleProfilePhoto()
//            HStack {
//                CustomTextFieldForSignUp(viewModel: viewModel)
//            }
//            .padding(30)
//            .padding(.bottom, 50)
//            Spacer()
//            ActionButtons_SignUpScreen(viewModel: viewModel)
//        }
//    }
//}
//
//struct CircleProfilePhoto: View {
//    var body: some View {
//        Image(Constants.profilePhoto)
//            .resizable()
//            .frame(width: 130, height: 130)
//            .clipShape(Circle())
//            .overlay(Circle()
//                        .stroke(Color(Constants.customLightRedColor),
//                                lineWidth: 1))
//    }
//}
//
//struct CustomTextFieldForSignUp: View {
//    
//    @ObservedObject var viewModel: SignUpViewModel
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 17) {
//            Text(Constants.usernameText)
//                .font(Font.custom(Constants.robotoMedium, size: 20))
//            TextField(Constants.emailAddressPlaceholder, text: $viewModel.login)
//                .textInputAutocapitalization(.never)
//            CustomDevider()
//            Text(Constants.passwordText)
//                .font(Font.custom(Constants.robotoMedium, size: 20))
//            TextField(Constants.enterYourPasswordPlaceholder, text: $viewModel.password)
//                .textInputAutocapitalization(.never)
//            CustomDevider()
//        }
//    }
//}
//
//// sign up and sign in buttons at the bottom of the screen
//struct ActionButtons_SignUpScreen: View {
//    
//    @ObservedObject var viewModel: SignUpViewModel
//    
//    var body: some View {
//        VStack(spacing: 50) {
//            Button {
//                viewModel.didTapSignUpButton()
//            } label: {
//                Text(Constants.signUpButtonText)
//                    .frame(width: getScreenBounds().width, height: 48, alignment: .center)
//                    .padding(.horizontal, -20)
//                    .foregroundColor(Color.white)
//                    .font(Font.custom(Constants.robotoItalic, size: 18))
//                    .background(Color(Constants.customLightRedColor))
//            }
//            Button {
//                viewModel.didTapSignInButton()
//            } label: {
//                Text(Constants.signInButtonText)
//                    .padding(.bottom, 40)
//                    .foregroundColor(Color(Constants.customLightRedColor))
//                    .font(Font.custom(Constants.robotoBoldItalic, size: 18))
//            }
//        }
//    }
//}
//
//struct SignUp_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUp(viewModel: SignUpViewModel())
//    }
//}
