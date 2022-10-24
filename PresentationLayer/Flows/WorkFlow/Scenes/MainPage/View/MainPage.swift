import SwiftUI

struct MainPage: View {
        
    @State var currentTab: Tab = .task
    @State var showAddTaskAlert = false
    
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack{
            VStack {
                TabView(selection: $currentTab) {
                    WorkListToday()
                        .tag(Tab.task)
                    Menu()
                        .tag(Tab.menu)
                    WorkListToday()
                        .tag(Tab.add)
                    QuickNote()
                        .tag(Tab.quick)
                    Profile()
                        .tag(Tab.profile)
                }
                
                // Tab bar config
                HStack(spacing: 0) {
                    ForEach(Tab.allCases, id: \.self) { tab in
                        Spacer()
                        Button {
                            currentTab = tab
                        } label: {
                            VStack {
                                if tab.info.image == "add" {
                                    Image("add")
                                        .offset(y: -25)
                                } else {
                                    Image(tab.info.image)
                                        .resizable()
                                        .renderingMode(.template)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 35, height: 28)
                                        .foregroundColor(currentTab == tab ? Color(Constants.activeIconColor) : Color(Constants.inactiveIconColor))
                                    Text(tab.info.title)
                                        .font(.custom(Constants.robotoItalic, size: 12))
                                        .foregroundColor(currentTab == tab ? Color(Constants.activeIconColor) : Color(Constants.inactiveIconColor))
                                }
                            }
                        }
                        Spacer()
                    }
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(
                    Color(Constants.tabBarColor)
                )
            }
            if currentTab.rawValue == "add" {
                AddTaskAlert(show: $showAddTaskAlert)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

enum Tab: String, CaseIterable {
    case task
    case menu
    case add
    case quick
    case profile
    
    var info: (image: String, title: String) {
        switch self {
        case .task:
            return ("task", "My Task")
        case .menu:
            return ("menu", "Menu")
        case .add:
            return ("add", "")
        case .quick:
            return ("quick", "Quick")
        case .profile:
            return ("profile", "Profile")
        }
    }
}
