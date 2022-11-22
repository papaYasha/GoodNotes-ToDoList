import SwiftUI

struct CompleteTask: View {
    
    @State var showComment = false
    @State var showSettings = false
    @State var degreeArrows = 0
    
    var body: some View {
        ZStack {
            
            // Background colors
            VStack(spacing: 0) {
                Color(Constants.customLightRedColor)
                Color(Constants.tabBarColor)
                    .frame(maxHeight: 100)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .overlay(Color.black.opacity(0.35))
            
            // Complete task view
            VStack {
                ScrollView {
                    
                    // Top buttons xmark and gear (settings)
                    HStack {
                        Button {
                            print("close cross tapped")
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                        
                        Button {
                            print("complete task settings tapped")
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
                    
                    // Task title
                    HStack {
                        Text("Meeting according with design team in Central Park")
                            .font(.custom(Constants.robotoItalic, size: 18))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding()
                    
                    HStack(spacing: 12) {
                        Image("woman")
                            .resizable()
                            .frame(width: 44, height: 44)
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Assigned to")
                                .font(.custom(Constants.robotoRegular, size: 16))
                                .foregroundColor(.gray.opacity(0.8))
                            Text("Stephen Chow")
                                .font(.custom(Constants.robotoItalic, size: 16))
                                .foregroundColor(.black.opacity(0.8))
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.leading)
                    
                    InfoAboutTaskCustomCell(imageName: "calendar", title: "Due Date", message: "Aug 5, 2018")
                    InfoAboutTaskCustomCell(imageName: "files", title: "Description", message: "Some description here!!!")
                    InfoAboutTaskCustomCell(imageName: "members", title: "Members", message: "some members")
                    InfoAboutTaskCustomCell(imageName: "tag", title: "Tag", message: "addtag to someone")
//                        .padding(.bottom)
                    
                    if showComment {
                        Comment(show: $showComment, text: "")
                            .padding(.bottom, -20)
                    }
                    
                    // Complete task and show comment button + comment view
                    VStack {
                        Button {
                            print("Complete task")
                        } label: {
                            Text("Complete Task")
                                .font(.custom(Constants.robotoItalic, size: 18))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, maxHeight: 50)
                                .background(Color(Constants.customLightBlueColor)
                                    .cornerRadius(7)
                                )
                        }
                        .frame(height: 40)
                        .padding([.top, .horizontal])
                        .padding(.horizontal)
                        
                        
                        HStack {
                            Text("Comment")
                                .font(.custom(Constants.robotoItalic, size: 18))
                                .foregroundColor(.black.opacity(0.8))
                            Button {
                                withAnimation {
                                    showComment.toggle()
                                    if degreeArrows == 0 {
                                        degreeArrows = 180
                                    } else {
                                        degreeArrows = 0
                                    }
                                }
                            } label: {
                                Image(Constants.arrows)
                                    .rotationEffect(.degrees(Double(degreeArrows)))
                            }
                        }
                        .padding(.top, 5)
                        .padding(.bottom)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .padding()
        }
    }
}

struct CompleteTaskSettings: View {
    
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            
            // Task settings alert
            VStack {
                Button {
                    print("Add member")
                } label: {
                    Text("Add Member")
                        .font(.custom(Constants.robotoItalic, size: 18))
                        .foregroundColor(.primary)
                }
                .padding(10)
                Button {
                    print("Edit task")
                } label: {
                    Text("Edit Task")
                        .font(.custom(Constants.robotoItalic, size: 18))
                        .foregroundColor(.primary)
                }
                .padding(10)
                Button {
                    print("Delete task")
                } label: {
                    Text("Delete Task")
                        .font(.custom(Constants.robotoItalic, size: 18))
                        .foregroundColor(.primary)
                    
                }
                .padding(10)
            }
            .frame(maxWidth: 280, maxHeight: 200)
            .background(Color.white)
            .contentShape(Rectangle())
            .cornerRadius(5)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.primary.opacity(0.35))
    }
}

struct Comment: View {
    
    @Binding var show: Bool
    @State var text = "Write a comment"
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // TextView
            VStack {
                TextEditor(text: $text)
                    .font(.custom(Constants.robotoRegular, size: 14))
                    .foregroundColor(.black)
                    .frame(height: 80)
                
                Color.gray.opacity(0.25)
                    .frame(width: .infinity, height: 1)
                    .padding(0)
                    .offset(y: 11)
                
                HStack(spacing: 20) {

                    // Attach image button
                    Button {
                        print("Attach image button tapped")
                    } label: {
                        Image(systemName: "photo")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.secondary)
                    }
                    .padding([.top, .leading, .bottom])

                    // Attach file button
                    Button {
                        print("Attach file button tapped")
                    } label: {
                        Image(systemName: "paperclip")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.secondary)
                    }

                    Spacer()

                    // Send button
                    Button {
                        print("send comment button tapped")
                    } label: {
                        Text("Send")
                            .font(.custom(Constants.robotoItalic, size: 17))
                            .foregroundColor(Color(Constants.customLightBlueColor))
                    }
                    .padding(.trailing)

                }
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.05))
            }
            .overlay(
                Rectangle()
                    .stroke(Color.gray.opacity(0.25), lineWidth: 1))
            .padding([.top, .leading, .trailing], 30)
            
            CommentHeader()
            
            // Comment content
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing.")
                .font(.custom(Constants.robotoRegular, size: 16))
                .foregroundColor(.primary)
                .padding([.horizontal, .bottom])
                .padding(.leading)
            
            CommentHeader()
            
            // Comment content
            Image("commentImage")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 180)
                .padding([.horizontal, .bottom])
                .padding(.horizontal)
        }
    }
}

struct InfoAboutTaskCustomCell: View {
    
    @State var imageName: String
    @State var title: String
    @State var message: String
    
    var body: some View {
        VStack {
            Color(Constants.customDividerColor)
                .frame(height: 1)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
            HStack(alignment: .top) {
                Image(imageName)
                    .resizable()
                    .frame(width: 18, height: 18)
                VStack(alignment: .leading, spacing: 5) {
                    Text(title)
                        .font(.custom(Constants.robotoRegular, size: 16))
                        .foregroundColor(.gray.opacity(0.8))
                    Text(message)
                        .font(.custom(Constants.robotoItalic, size: 16))
                        .foregroundColor(.black.opacity(0.8))
                }
                .padding(.leading)
                Spacer()
            }
            .padding([.top, .horizontal])
            .padding(.horizontal, 25)
        }
    }
}

struct CommentHeader: View {
    var body: some View {
        HStack(spacing: 10) {
            Image("woman")
                .resizable()
                .frame(width: 34, height: 34)
                .padding(.leading)
            VStack(alignment: .leading, spacing: 5) {
                Text("Sthephen Chow")
                    .font(.custom(Constants.robotoItalic, size: 16))
                    .foregroundColor(.black.opacity(0.8))
                Text("3 days ago")
                    .font(.custom(Constants.robotoRegular, size: 16))
                    .foregroundColor(.gray.opacity(0.8))
            }
        }
        .padding([.horizontal, .top])
    }
}


struct CompleteTask_Previews: PreviewProvider {
    static var previews: some View {
        CompleteTask()
    }
}
