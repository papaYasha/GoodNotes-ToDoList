import SwiftUI

struct SuccessfulReset: View {
    
    @StateObject var viewModel: SuccessfulResetViewModel
    
    var body: some View {
        VStack {
            Image(Constants.successfulResetImage)
            Text(LocalizationConstants.successfulResetTitle)
                .font(Font.custom(Constants.robotoItalic, size: 32))
                .foregroundColor(Color(Constants.customLightBlackColor))
                .padding(.vertical, 10.0)
            Text(LocalizationConstants.successfulResetMessage)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20.0)
        }
        .onTapGesture {
            viewModel.tapGestureDidTapped()
        }
    }
}

struct SuccessfulReset_Previews: PreviewProvider {
    static var previews: some View {
        SuccessfulReset(viewModel: SuccessfulResetViewModel())
    }
}
