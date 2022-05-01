//
//  test.swift
//  FormatDescription
//
//  Created by 김동락 on 2022/04/30.
//

import SwiftUI

struct TestView: View {
    @State private var showingOptions = false
    @State private var selection = "None"

    var body: some View {
        VStack {
            Text(selection)

            Button("Show Options") {
                showingOptions = true
            }
            .actionSheet(isPresented: $showingOptions) {
                ActionSheet(
                    title: Text("Select a color"),
                    buttons: [
                        .default(Text("Red")) {
                            selection = "Red"
                        },

                        .default(Text("Green")) {
                            selection = "Green"
                        },

                        .default(Text("Blue")) {
                            selection = "Blue"
                        },
                    ]
                )
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
