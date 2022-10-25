import SwiftUI

struct AddTaskAlert: View {
    
    @Binding var show: Bool
    @ObservedObject var viewModel: AddTaskViewModel
    
    var body: some View {
        ZStack {
            
            VStack {
                Button {
                    viewModel.didTapAddTaskButton()
                } label: {
                    Text("Add Task")
                        .font(.custom(Constants.robotoItalic, size: 18))
                        .foregroundColor(.primary)
                }
                .padding(10)
                Divider()
                Button {
                    viewModel.didTapQuickNoteButton()
                } label: {
                    Text("Add Quick Note")
                        .font(.custom(Constants.robotoItalic, size: 18))
                        .foregroundColor(.primary)
                }
                .padding(10)
                Divider()
                Button {
                    viewModel.didTapCheckListButton()
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
