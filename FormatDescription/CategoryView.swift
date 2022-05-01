//
//  CategoryView.swift
//  FormatDescription
//
//  Created by 김동락 on 2022/04/29.
//

import SwiftUI

struct CategoryView: View {
    let fileList: [Format]
    let fileType: FileType
    let buttonColor: String
    let selectedColor: String
    @State var selectedIndex: [Int]
    @State var isClicked: [Bool]
    @State var isLinkActive = false
    
    //image인지 video인지에 따라 구분
    init(fileType: FileType) {
        if fileType == .Image {
            fileList = FormatData.imageFormats
            self.buttonColor = "#FCF8CD"
            self.selectedColor = "#E8E4BA"
        } else {
            fileList = FormatData.videoFormats
            self.buttonColor = "#FDE4D0"
            self.selectedColor = "#E2CCBB"
        }
        self.fileType = fileType
        self.selectedIndex = []
        self.isClicked = [Bool](repeating: false, count: fileList.count)
    }
    
    //카테고리 버튼 형식 구현
    func makeCategoryButton(index: Int) -> some View {
        return Button(action:{
            isClicked[index].toggle()
        }){
            Text(fileList[index].name)
                .padding(20)
                .frame(width: 170)
                .foregroundColor(Color.black)
                .background(Color(hex: isClicked[index] ? selectedColor : buttonColor))
                .font(.system(size: 20))
                .cornerRadius(15)
                .padding(.vertical, 5)
                .shadow(radius: 2, x: 2, y: 2)
                .overlay(
                    Image(systemName: "checkmark.circle.fill")
                        .padding(.top, 10)
                        .padding(.trailing, 5)
                        .foregroundColor(Color(hex: "#0BC936"))
                        .font(.system(size: 20))
                        .opacity(isClicked[index] ? 1 : 0),
                    alignment: .topTrailing
                )
        }
    }
    
    var body: some View {
        VStack{
            //2개씩 나오는 그리드 뷰 구현
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ]){
                    ForEach(0..<fileList.count, id: \.self) { i in
                        makeCategoryButton(index: i)
                    }
                }
            }
            
            //선택 버튼
            Button (action: {
                selectedIndex = []
                for (idx, clicked) in isClicked.enumerated() {
                    if clicked {
                            selectedIndex.append(idx)
                            isClicked[idx] = false
                    }
                }
                isLinkActive = true
            }) {
                Text("선택하기")
                    .foregroundColor(Color.black)
                    .font(.system(size: 20, weight: .bold))
                    .frame(width: 200, height: 70)
                    .background(Color(hex: fileType == .Image ? "#FFEA67" : "#FFBE78"))
                    .cornerRadius(15)
                    .shadow(radius: 5, x: 5, y: 5)
            }
        }
        .padding()
        .navigationTitle(fileType == .Image ? "이미지" : "비디오")
        .navigationBarTitleDisplayMode(.inline)
        .background(NavigationLink(destination: DetailView(fileType: fileType, selectedIndex: selectedIndex), isActive: $isLinkActive){})
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(fileType: .Video)
    }
}
