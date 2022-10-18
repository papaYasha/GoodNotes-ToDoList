import SwiftUI

struct OffsetScrollView<Content: View>: UIViewRepresentable {

    var content: Content
    @Binding var offset: CGFloat

    func makeCoordinator() -> Coordinator {
        return OffsetScrollView.Coordinator(parent: self)
    }

    init(offset: Binding<CGFloat>, @ViewBuilder content: @escaping () -> Content) {
        self.content = content()
        self._offset = offset
    }

    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()

        // Extracting SwiftUI view and embedding into UIKit ScrollView

        let hostView = UIHostingController(rootView: content)
        hostView.view.translatesAutoresizingMaskIntoConstraints = false

        //Clearing BG
        hostView.view.backgroundColor = .clear

        let constraints = [
            hostView.view.topAnchor.constraint(equalTo: scrollView.topAnchor),
            hostView.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            hostView.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            hostView.view.heightAnchor.constraint(equalTo: scrollView.heightAnchor)

        ]

        scrollView.addSubview(hostView.view)
        scrollView.addConstraints(constraints)

        // Enabling paging

        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false

        // Setting Delegate

        scrollView.delegate = context.coordinator

        return scrollView
    }

    func updateUIView(_ uiView: UIScrollView, context: Context) {
        let currentOffset = uiView.contentOffset.x
        if currentOffset != offset {
            uiView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
        }
    }

    // Pager Offset

    class Coordinator: NSObject, UIScrollViewDelegate {
        var parent: OffsetScrollView

        init(parent: OffsetScrollView) {
            self.parent = parent
        }

        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offset = scrollView.contentOffset.x
            parent.offset = offset
        }
    }
}
