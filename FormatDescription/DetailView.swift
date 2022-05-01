//
//  DetailView.swift
//  FormatDescription
//
//  Created by 김동락 on 2022/04/29.
//

import SwiftUI

struct DetailView: View {
    let fileType: FileType
    let fileList: [Format]
    var showingFormats:[Format]
    @State var showActionSheet:Bool = false
    
    // 선택한 카테고리 정보 보여주도록 설정하기
    init(fileType: FileType, selectedIndex: [Int]){
        self.fileType = fileType
        // 파일 리스트 정하기
        if fileType == .Image {
            fileList = FormatData.imageFormats
        } else {
            fileList = FormatData.videoFormats
        }
        // 카테고리에서 고른 포맷 정보 보여주기
        showingFormats = []
        for i in selectedIndex {
            showingFormats.append(fileList[i])
        }
    }
    
    var body: some View {
        VStack {
            // 페이지 뷰 구현
            TabView {
                ForEach(showingFormats, id: \.name){ format in
                    VStack{
                        Text("\(format.name)")
                            .font(.system(size: 30, weight: .semibold))
                        Image(format.fileName)
                            .resizable()
                            .cornerRadius(20)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 320)
                        ScrollView{
                            VStack{
                                Text(format.description)
                                    .font(.system(size: 20))
                                    .padding(.vertical, 10)
                                Text("용량: \(format.volume)")
                                    .font(.system(size: 15))
                                Text("사용환경: \(format.environment)")
                                    .font(.system(size: 15))
                            }
                        }
                        .padding()
                        .frame(width: 320,height: 350)
                        .foregroundColor(Color.black)
                        .background(Color(hex: "#FFE3E5"))
                        .cornerRadius(15)
                        Spacer()
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(fileType: .Image, selectedIndex: [0, 1, 2])
    }
}

