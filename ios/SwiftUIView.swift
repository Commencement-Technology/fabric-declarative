//
//  SwiftUIView.swift
//  react-native-fabric-declarative
//
//  Created by Andrei Khavkunov on 06.06.2024.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack {
            Text("Title")
                .font(.title)
            
            TextField("Input text", text: .constant(""))
                .textFieldStyle(.roundedBorder)
            
            Picker(
                "Flavor",
                selection: .constant(1)
            ) {
                ForEach(1..<3, id: \.self) { num in
                    Text("Number: \(num)")
                }
            }
            .padding()
            
            
            
            Button(action: {}) {
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


@objc public class SwiftUIViewManager: NSObject {
    
    private let hostingController: UIHostingController<SwiftUIView>
    
    @objc public override init() {
        hostingController = UIHostingController(rootView: SwiftUIView())
        super.init()
    }
    
    @objc public func getView() -> UIView {
        return hostingController.view
    }
    
}
