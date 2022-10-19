import SwiftUI

struct Onboarding: View {
    
    @State var offset: CGFloat = 0

    var body: some View {

        // Custom pager view
        OffsetScrollView(offset: $offset) {
            HStack(spacing: 0) {
                ForEach(boardingScreens) { screen in
                    VStack(spacing: 10) {
                        Image(screen.contentImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: getScreenBounds().width - 100, height: getScreenBounds().width - 80)
                        VStack(alignment: .center, spacing: 12) {
                            Text(screen.title)
                                .font(Font.custom("Roboto-ThinItalic", size: 24))
                                .foregroundColor(Color(Constants.onboardingTextColor))
                            Text(screen.message)
                                .font(Font.custom("Roboto-Bold", size: 18))
                                .foregroundColor(Color(Constants.onboardingTextColor))
                            }
                        .frame(maxWidth: .infinity, alignment: .center)
                        Spacer()
                    }
                    .padding(.top, 50)
                    .padding()
                    .frame(width: getScreenBounds().width)
                    .frame(maxHeight: .infinity)
                }
            } .ignoresSafeArea()
        }
        .onChange(of: offset) { _ in
            print(offset)
        }

        .background(
            VStack(alignment: .center) {
                Spacer()
                Image(getImageName()).resizable()
                    .frame(maxWidth: .infinity, maxHeight: getScreenBounds().height / 2.8)
                    .animation(.easeInOut, value: getIndex())
            }.background(Color(Constants.onboardingBackgroundColor))
        )
        .ignoresSafeArea(.container, edges: .all)
        .overlay(
            VStack {
                HStack(spacing: 8) {
                    ForEach(boardingScreens.indices,id: \.self) { index in
                        Circle()
                            .foregroundColor(Color(Constants.onboardingTextColor))
                            .frame(width: 8, height: 8)
                            .opacity(index == getIndex() ? 1 : 0.4)
                            .animation(.easeInOut, value: getIndex())
                    }
                }
                .frame(maxHeight: getScreenBounds().height / 2.5)
                HStack {
                    Button(action: {
                        print("action")
                    }, label: {
                        Text("Get Started")
                            .font(Font.custom("Roboto-ThinItalic", size: 18))
                            .foregroundColor(Color(Constants.onboardingTextColor))
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .background(Color(Constants.onboardingBackgroundColor))
                            .cornerRadius(5)

                    })
                    .padding(.horizontal, 45)
                    .shadow(color: Color.black.opacity(0.25), radius: 8, x: 10, y: 12)
                }
            }
            .padding(.vertical, 70)
            ,alignment: .bottom
        )
    }

    // Changing BGImage based on offset
    func getIndex() -> Int {
        let progress = (offset / getScreenBounds().width).rounded()
        return Int(progress)
    }

    func getImageName() -> String {
        let imageName = "background\(getIndex() + 1)"
        return imageName
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
       Onboarding()
    }
}

// Extending View to get screen bounds
extension View {
    func getScreenBounds() -> CGRect {
        return UIScreen.main.bounds
    }
}
