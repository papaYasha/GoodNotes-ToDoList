import SwiftUI

struct AddTaskAlert: View {
    
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            
            VStack {
                Button {
                    print("Add Task")
                } label: {
                    Text("Add Task")
                        .font(.custom(Constants.robotoItalic, size: 18))
                        .foregroundColor(.primary)
                }
                .padding(10)
                Divider()
                Button {
                    print("Add Quick Note")
                } label: {
                    Text("Add Quick Note")
                        .font(.custom(Constants.robotoItalic, size: 18))
                        .foregroundColor(.primary)
                }
                .padding(10)
                Divider()
                Button {
                    print("Add Check List")
                } label: {
                    Text("Add Check List")
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
    }
}
