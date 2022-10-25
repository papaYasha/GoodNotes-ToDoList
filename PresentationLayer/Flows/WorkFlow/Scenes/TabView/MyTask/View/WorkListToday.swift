import SwiftUI

struct WorkListToday: View {
        
    @StateObject var viewModel = TaskViewModel()
    @State var currentTab: TaskTerm = .today
    @State var showTaskFilterMenu = false
    @State var currentDate = Date()
    
    var body: some View {
        ZStack {
            
            VStack {
                
                //Navigation bar
                VStack {
                    
                    // Nav bar header
                    HStack {
                        Spacer()
                        Text(LocalizationConstants.workListNavBarTitle)
                            .foregroundColor(.white)
                            .font(.custom(Constants.robotoItalic, size: 20))
                            .offset(x: 8)
                        Spacer()
                        Button {
                            withAnimation {
                                showTaskFilterMenu.toggle()
                            }
                        } label: {
                            Image(systemName: "gear")
                                .foregroundColor(.white)
                                .frame(width: 20, height: 21)
                        }
                    }
                    .padding([.horizontal, .bottom], 20)
                    
                    // Term switch view
                    HStack(spacing: 50) {
                        Spacer()
                        Button {
                            print("Today button tapped")
                            currentTab = .today
                        } label: {
                            Text(LocalizationConstants.todayTabText)
                                .foregroundColor(currentTab == .today ? .white : Color(.white).opacity(0.5))
                                .font(.custom(Constants.robotoMedium, size: 18))
                                .overlay(
                                    ZStack {
                                        if currentTab == .today {
                                            Capsule()
                                                .fill(Color.white)
                                                .frame(height: 4)
                                        } else {
                                            Capsule()
                                                .fill(Color.clear)
                                                .frame(height: 4)
                                        }
                                    }
                                        .padding(.horizontal, -25)
                                        .offset(y: 16)
                                    ,alignment: .bottom
                                )
                        }
                        Spacer()
                        Button {
                            print("Month button tapped")
                            currentTab = .month
                        } label: {
                            Text(LocalizationConstants.monthTabText)
                                .foregroundColor(currentTab == .month ? .white : Color(.white).opacity(0.5))
                                .font(.custom(Constants.robotoMedium, size: 18))
                                .overlay(
                                    ZStack {
                                        if currentTab == .month {
                                            Capsule()
                                                .fill(Color.white)
                                                .frame(height: 4)
                                        } else {
                                            Capsule()
                                                .fill(Color.clear)
                                                .frame(height: 4)
                                        }
                                    }
                                        .padding(.horizontal, -25)
                                        .offset(y: 16)
                                    ,alignment: .bottom
                                )
                        }
                        Spacer()
                    }
                    .padding(.bottom)
                }
                .padding(.top, 70)
                .frame(maxWidth: .infinity)
                .background(
                    Color(Constants.customLightRedColor)
                )
                TaskView()
            }
            .background(Color(Constants.workListBackground))
            .ignoresSafeArea()
            
            if showTaskFilterMenu {
                TaskFilterAlert(show: $showTaskFilterMenu)
            }
        }
    }
}
struct WorkListToday_Previews: PreviewProvider {
    static var previews: some View {
        WorkListToday()
    }
}

enum TaskTerm: String, CaseIterable {
    case today = "Today"
    case month = "Month"
}
