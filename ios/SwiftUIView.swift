//
//  SwiftUIView.swift
//  react-native-fabric-declarative
//
//  Created by Andrei Khavkunov on 06.06.2024.
//

import SwiftUI

struct SwiftUIView: View {

    @StateObject var viewModel: SwiftUIViewModel

    var onSubmit: ((String, Double, [Double]) -> Void)?

    var body: some View {
        VStack {
            Text(viewModel.title)
                .font(.title)

            TextField("Input text", text: $viewModel.inputString)
                .textFieldStyle(.roundedBorder)

            Picker(
                "Flavor",
                selection: $viewModel.selectedOption
            ) {
                ForEach(viewModel.options, id: \.self) { num in
                    HStack {
                        Text("Number: \(num)")
                    }
                }
            }
            .padding()



            Button(action: {
                let restNumbers = viewModel.options.filter { it in
                    it != viewModel.selectedOption
                }

                onSubmit?(viewModel.inputString, viewModel.selectedOption, restNumbers)
            }) {
                Text("Submit")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
            }
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .clipShape(Capsule())
        }
        .padding()
        .background(Color(red: 0, green: 0, blue: 0, opacity: 0.1))
    }
}



class SwiftUIViewModel : ObservableObject {
    @Published var title: String = ""
    @Published var options: [Double] = []
    @Published var selectedOption: Double = 0
    @Published var inputString: String = ""
}

@objc public class SwiftUIViewManager: NSObject {

    private let hostingController: UIHostingController<SwiftUIView>
    private let viewModel: SwiftUIViewModel

    @objc public var onSubmit: ((String, Double, [Double]) -> Void)?

    @objc public override init() {
        viewModel = SwiftUIViewModel()

        var handleSubmit: ((String, Double, [Double]) -> Void)?

        hostingController = UIHostingController(
            rootView: SwiftUIView(
                viewModel: self.viewModel,
                onSubmit: { (inputString, selectedNumber, restNumbers) in
                    handleSubmit?(inputString, selectedNumber, restNumbers)
                }
            )
        )

        super.init()

        handleSubmit = { (inputString, selectedNumber, restNumbers) in
            self.onSubmit?(inputString, selectedNumber, restNumbers)
        }

    }

    @objc public func getView() -> UIView {
        return hostingController.view
    }

    @objc public func updateTitle(newTitle: String) {
        viewModel.title = newTitle
    }

    @objc public func updateOptions(newOptions: [Double]) {
        viewModel.options = newOptions
    }

}
