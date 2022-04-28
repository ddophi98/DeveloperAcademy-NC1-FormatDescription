//
//  MainView.swift
//  FormatDescription
//
//  Created by 김동락 on 2022/04/28.
//

import SwiftUI

enum ViewType{
    case ImageCategoryView, VideoCategoryView, CollectView, SearchView
}

struct MainView: View {
    var body: some View {
        NavigationView{
            VStack(spacing: 50){
                MainButton(imageName: "photo", description: "이미지", iconColor: Color(hex: "#FFC900"), backgroundColor: Color(hex: "#FCF8CD"), viewType: .ImageCategoryView)
                MainButton(imageName: "video.fill", description: "비디오", iconColor: Color(hex: "#FF7100"), backgroundColor: Color(hex: "#FDE4D0"), viewType: .VideoCategoryView)
                MainButton(imageName: "circle.grid.3x3.circle.fill", description: "모아보기", iconColor: Color(hex: "#ED5E67"), backgroundColor: Color(hex: "#FFCFD2"), viewType: .CollectView)
                MainButton(imageName: "magnifyingglass.circle.fill", description: "검색", iconColor: Color(hex: "#FF31D9"), backgroundColor: Color(hex: "#F1C0E8"), viewType: .SearchView)
            }
            .navigationBarHidden(true)
        }
    }
}

struct MainButton: View{
    @State var isLinkActive = false
    let imageName: String
    let description: String
    let iconColor: Color
    let backgroundColor: Color
    let viewType: ViewType
    func targetView() -> some View {
        switch viewType {
            case .ImageCategoryView:
                return AnyView(ImageCategoryView())
            case .VideoCategoryView:
                return AnyView(VideoCategoryView())
            case .CollectView:
                return AnyView(CollectView())
            case .SearchView:
                return AnyView(SearchView())
        }
    }
    var body: some View {
        NavigationLink(destination: targetView(), isActive: $isLinkActive){
            Button(action: {
                self.isLinkActive = true
            }){
                VStack(spacing: 15){
                    Image(systemName: imageName)
                        .foregroundColor(iconColor)
                        .font(.system(size: 30))
                    Text(description)
                        .foregroundColor(Color.black)
                        .font(.system(size: 20))
                }
                .frame(width: 300, height: 100)
                .background(backgroundColor)
                .cornerRadius(15)
                .shadow(radius: 5, x: 5, y: 5)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

