import SwiftUI

struct TaskFilterAlert: View {
    
    @Binding var show: Bool
    @State var showCheckMark = 0
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        HStack {
                            Button {
                                print("Incomplete tasks tapped")
                                    showCheckMark = 0
                            } label: {
                                Text(LocalizationConstants.incompleteTaskButtonText)
                                    .font(.custom(Constants.robotoItalic, size: 17))
                                    .foregroundColor(.primary)
                            }
                            Spacer()
                            Image(showCheckMark == 0 ? Constants.checkmark : "")
                        }.padding(15)
                        HStack {
                            Button {
                                print("Completed tasks")
                                    showCheckMark = 1
                            } label: {
                                Text(LocalizationConstants.completeTaskButtonText)
                                    .font(.custom(Constants.robotoItalic, size: 17))
                                    .foregroundColor(.primary)
                            }
                            Spacer()
                            Image(showCheckMark == 1 ? Constants.checkmark : "")
                        }.padding([.bottom, .trailing, .leading], 15)
                        HStack {
                            Button {
                                print("All tasks")
                                    showCheckMark = 2
                            } label: {
                                Text(LocalizationConstants.allTaskButtonText)
                                    .font(.custom(Constants.robotoItalic, size: 17))
                                    .foregroundColor(.primary)
                            }
                            Spacer()
                            Image(showCheckMark == 2 ? Constants.checkmark : "")
                        }
                        .padding([.bottom, .trailing, .leading], 15)
                    }
                    .frame(maxWidth: 230)
                    .background(Color.white)
                    .contentShape(Rectangle())
                    .cornerRadius(5)
                    .shadow(color: .gray.opacity(0.1), radius: 2, x: 0, y: 9)
                }
                .padding(8)
                Spacer()
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.primary.opacity(0.35)).ignoresSafeArea()
    }
}
