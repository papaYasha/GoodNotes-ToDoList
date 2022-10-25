import SwiftUI

struct LeftArrow: View {
    
    //@IbservedObject var viewModel: AnyViewModel
        
    var body: some View {
        HStack {
            Button {
                print("dismiss VC")
                //viewModel.action()
            } label: {
                Image(systemName: Constants.arrowLeftBackButton)
                    .resizable()
                    .frame(width: 25, height: 17)
                    .foregroundColor(Color(Constants.onboardingText))
            }
            Spacer()
        }
        .padding(.horizontal, 30)
    }
}

struct LeftArrow_Previews: PreviewProvider {
    static var previews: some View {
        LeftArrow()
    }
}
