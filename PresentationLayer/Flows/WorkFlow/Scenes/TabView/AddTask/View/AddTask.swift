import SwiftUI

struct AddTask: View {
    
    @State var text = "Title"
    @State var description = "Description"
    @State var showAddTaskAndAnything = false
    
    var body: some View {
        ZStack {
            
            // Navigation and tab bars
            VStack {
                CustomNavBarAddTask()
                Spacer()
                CustomBottomRectangle()
            }
            .edgesIgnoringSafeArea(.bottom)
            
            // Task custom view
            VStack {
                
                ZStack {
                    
                    VStack {
                        
                        ChooseAssigneeAndProject(didTap: $showAddTaskAndAnything)
                        TextField("", text: $text)
                            .foregroundColor(.black)
                            .font(.custom(Constants.robotoItalic, size: 18))
                            .padding(20)
                            .background(
                                Color(Constants.customRectangleLightGrayColor)
                            )
                        CustomTextViewAndAttachButton()
                        DueDate()
                        AddMemberAndTask()
                        
                    }
                    .background(Color.white)
                    .contentShape(Rectangle())
                    .cornerRadius(5)
                    .shadow(color: .white.opacity(0.25), radius: 3, x: 4, y: 5)
                    .shadow(color: .black.opacity(0.25), radius: 3, x: 4, y: 0)
                    
                    if showAddTaskAndAnything {
                        CreateTaskAddAnything(viewModel: AssigneeViewModel(), show: $showAddTaskAndAnything)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding([.leading, .trailing], 20)
            .padding(.top, 60)
            .padding(.bottom, 5)
        }
    }
}

struct CreateTaskAddAnything: View {
    
    let viewModel: AssigneeViewModel
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            Color(Constants.customRectangleLightGrayColor)
                .padding(.top, 100)
            VStack(alignment: .leading) {
                ForEach(viewModel.assignees, id: \.id) { assignee in
                    HStack {
                        Image(systemName: assignee.image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 35)
                            .clipShape(Circle())
                        VStack(alignment: .leading) {
                            Text(assignee.name)
                                .font(.custom(Constants.robotoItalic, size: 16))
                                .foregroundColor(.black).opacity(0.35)
                            Text(assignee.email)
                                .font(.custom(Constants.robotoRegular, size: 14).bold())
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.vertical)
                }
            }
        }
    }
}

struct CustomDividerIntoForm: View {
    let color: Color
    let height: CGFloat
    
    init(color: Color = .gray.opacity(0.5),
         height: CGFloat = 0.5) {
        self.color = color
        self.height = height
    }
    
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: height)
            .edgesIgnoringSafeArea(.horizontal)
    }
}

struct CustomNavBarAddTask: View {
    var body: some View {
        VStack {
            HStack {
                Button {
                    print("back button tapepd")
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 21)
                        .foregroundColor(.white)
                }.padding()
                
                Spacer()
                
                Text(LocalizationConstants.newTaskNavBarTitle)
                    .foregroundColor(.white)
                    .font(.custom(Constants.robotoItalic, size: 20))
                    .offset(x: -25)
                Spacer()
            }
            .padding(.bottom, 70)
            .offset(y: 45)
        }
        .background(
            Color(Constants.customLightRedColor)
        ).edgesIgnoringSafeArea(.top)
    }
}

struct CustomBottomRectangle: View {
    var body: some View {
        HStack {
            Color(Constants.tabBarColor)
                .frame(maxWidth: .infinity, maxHeight: 100).ignoresSafeArea()
        }
    }
}

struct ChooseAssigneeAndProject: View {
    
    @Binding var didTap: Bool
    
    var body: some View {
        HStack {
            Text("For")
                .font(.custom(Constants.robotoItalic, size: 18))
                .foregroundColor(.black)
                .padding(5)
            Button {
                withAnimation {
                    didTap.toggle()
                }
            } label: {
                Text("Assignee")
                    .font(.custom(Constants.robotoRegular, size: 14).bold())
                    .foregroundColor(.black)
            }
            .padding()
            .background(Color(Constants.customRectangleLightGrayColor))
            .clipShape(Rectangle())
            .cornerRadius(40)
            
            Spacer()
            
            Text("In")
                .font(.custom(Constants.robotoItalic, size: 18))
                .foregroundColor(.black)
                .padding(5)
            Button {
                print("choose project")
            } label: {
                Text("Project")
                    .font(.custom(Constants.robotoRegular, size: 14).bold())
                    .foregroundColor(.black)
            }
            .padding()
            .background(Color(Constants.customRectangleLightGrayColor))
            .clipShape(Rectangle())
            .cornerRadius(40)
        }
        .padding([.top, .bottom], 10)
        .padding(20)
    }
}

struct CustomTextViewAndAttachButton: View {
    
    @State var description = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Description")
                    .font(.custom(Constants.robotoRegular, size: 16))
                    .foregroundColor(Color(Constants.customLightGrayColor))
                    .padding(.leading, 20)
            }
            VStack(alignment: .leading) {
                VStack {
                    TextEditor(text: $description)
                        .font(.custom(Constants.robotoRegular, size: 14))
                        .foregroundColor(.black)
                        .frame(maxHeight: 80)
                    CustomDividerIntoForm(color: .gray.opacity(0.5), height: 1)
                        .offset(y: -8)
                    HStack {
                        Button {
                            print("attach")
                        } label: {
                            Image(systemName: "paperclip")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding([.bottom, .leading], 15)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                )
                .background(
                    Color(Constants.customRectangleLightGrayColor)
                )
                .cornerRadius(8)
            }
            .padding([.trailing, .leading], 20)
            .padding(.bottom)
        }
    }
}

struct DueDate: View {
    var body: some View {
        HStack(spacing: 10) {
            Text("Due Date")
                .font(.custom(Constants.robotoRegular, size: 16))
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding()
                .padding(.leading, 10)
            
            Button {
                print("choose due date")
            } label: {
                Text("Anytime")
                    .font(.custom(Constants.robotoRegular, size: 14))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(Color(Constants.customLightBlueColor))
                            .frame(width: 90, height: 30)
                    )
            }
            .padding(20)
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .background(
            Color(Constants.customRectangleLightGrayColor)
        )
    }
}

struct AddMemberAndTask: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Add Memder")
                .font(.custom(Constants.robotoRegular, size: 16))
                .foregroundColor(.black)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.top, .leading, .trailing])
            HStack {
                Button {
                    print("choose assignee")
                } label: {
                    Text("Anyone")
                        .font(.custom(Constants.robotoRegular, size: 14).bold())
                        .foregroundColor(.black)
                }
                .padding()
                .background(Color(Constants.customRectangleLightGrayColor))
                .clipShape(Rectangle())
                .cornerRadius(40)
                
                Button {
                    print("add member")
                } label: {
                    Text("+")
                        .font(.custom(Constants.robotoRegular, size: 18))
                        .foregroundColor(.white)
                        .padding(10)
                        .background(
                            Circle()
                                .foregroundColor(.gray.opacity(0.6))
                        )
                }
            }
            .padding(.leading, 10)
            
            Spacer()
            
            Button {
                print("add task")
            } label: {
                Text("Add Task")
                    .font(.custom(Constants.robotoItalic, size: 18))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color(Constants.customLightRedColor)
                        .cornerRadius(7)
                    )
            }
            .padding(.top)
            .padding([.leading, .trailing])
            .padding(.bottom)
            
            Spacer()
        }
        .padding([.leading, .trailing], 10)
    }
}

struct AddTask_Previews: PreviewProvider {
    static var previews: some View {
        AddTask()
    }
}
