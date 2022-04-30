//
//  CategoryView.swift
//  FormatDescription
//
//  Created by 김동락 on 2022/04/29.
//

import SwiftUI

struct CategoryView: View {
    let fileList: [Format]
    let buttonColor: String
    let fileType: FileType
    @State var isLinkActive: [Bool]
    
    //image인지 video인지에 따라 구분
    init(fileType: FileType) {
        if fileType == .Image {
            fileList = FormatData.imageFormats
            self.buttonColor = "#FCF8CD"
        } else {
            fileList = FormatData.videoFormats
            self.buttonColor = "#FDE4D0"
        }
        self.isLinkActive = [Bool](repeating: false, count: fileList.count)
        self.fileType = fileType
    }
    
    //카테고리 버튼 형식 구현
    func makeCategoryButton(index: Int) -> some View {
        return NavigationLink(destination: DetailView(fileType: fileType, selectedIndex: index), isActive: $isLinkActive[index]){
            Button(action:{
                isLinkActive[index] = true
            }){
                Text(fileList[index].name)
                    .padding(20)
                    .frame(width: 170)
                    .foregroundColor(Color.black)
                    .background(Color(hex: buttonColor))
                    .font(.system(size: 20))
                    .cornerRadius(15)
                    .shadow(radius: 3, x: 3, y: 3)
            }
        }
    }
    
    var body: some View {
        //2개씩 나오는 그리드 뷰 구현
        ScrollView{
            VStack(spacing: 15) {
                ForEach(0..<fileList.count/2, id: \.self) { i in
                    HStack(spacing: 15) {
                        ForEach(0..<2) { j in
                            makeCategoryButton(index: i*2+j)
                        }
                    }
                }
                //리스트의 아이템 개수가 홀수개라면 하나 따로 추가
                if fileList.count%2 == 1{
                    HStack(spacing: 15){
                        makeCategoryButton(index: fileList.count-1)
                        Text("")
                            .padding(20)
                            .frame(width: 170)
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
        .navigationTitle("이미지")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.top, 20)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(fileType: .Video)
    }
}
