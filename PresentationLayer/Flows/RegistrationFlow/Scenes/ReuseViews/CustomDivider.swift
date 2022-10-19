import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Divider()
            .frame(height: 3)
            .padding(.horizontal, 30)
            .background(Color(Constants.customDividerColor))
            .padding(.top, -5)
    }
}

struct CustomDevider_Previews: PreviewProvider {
    static var previews: some View {
        CustomDivider()
    }
}
