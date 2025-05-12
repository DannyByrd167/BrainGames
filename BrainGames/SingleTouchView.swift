import SwiftUI

class SingleTouchView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isMultipleTouchEnabled = false
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.isMultipleTouchEnabled = false
    }
}

struct SingleTouchViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> SingleTouchView {
        return SingleTouchView()
    }

    func updateUIView(_ uiView: SingleTouchView, context: Context) {
        // No-op
    }
}
