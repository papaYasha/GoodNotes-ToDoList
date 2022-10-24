import SwiftUI

struct TaskView: View {
    
    @StateObject var viewModel = TaskViewModel()
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 16) {
                ForEach(viewModel.tasks, id: \.self) { task in
                    HStack {
                        Button {
                            print("circle tapped")
                        } label: {
                            Image(task.isCompleted ? Constants.circleRed : Constants.blueCircle)
                                .foregroundColor(task.isCompleted ? Color.red : Color.blue)
                        }
                        .padding(20)
                        VStack(alignment: .leading, spacing: 5) {
                            Text(task.title)
                                .font(.custom(Constants.robotoRegular, size: 16).bold())
                                .lineLimit(2)
                                .minimumScaleFactor(0.5)
                            Text(task.time)
                                .font(.custom(Constants.robotoRegular, size: 16))
                                .foregroundColor(Color.secondary)
                        }
                        Spacer()
                        Image(task.isCompleted ? Constants.redRectangle : Constants.blueRectangle)
                    }
                    .padding(.vertical)
                    .background(Color.white)
                    .contentShape(Rectangle())
                    .cornerRadius(5)
                    .shadow(color: .gray.opacity(0.1), radius: 2, x: 0, y: 9)
                    .padding()
                }
            }
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
