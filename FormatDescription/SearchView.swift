//
//  SearchView.swift
//  FormatDescription
//
//  Created by 김동락 on 2022/04/28.
//

import SwiftUI

struct SearchView: View {
    @State var searchingText = ""
    @State var isLinkActive = false
    @State var searchedFileList = [Format]()
    @State var selectedIndex: Int = 0
    @State var selectedFileType: FileType = .Image
    
    //카테고리 버튼 형식 구현
    func makeCategoryButton(index: Int, fileType: FileType) -> some View {
        return Button(action:{
            isLinkActive = true
            self.selectedIndex = index
            self.selectedFileType = fileType
        }){
            Text(fileType == .Image ? FormatData.imageFormats[index].name : FormatData.videoFormats[index].name)
                .padding(20)
                .frame(width: 170)
                .foregroundColor(Color.black)
                .background(Color(hex: fileType == .Image ? "#FCF8CD" : "#FDE4D0"))
                .font(.system(size: 20))
                .cornerRadius(15)
                .padding(.vertical, 5)
                .shadow(radius: 2, x: 2, y: 2)
        }
    }
    //검색 알고리즘
    func matchFile(idx: Int) -> FileType? {
        if idx < FormatData.imageFormats.count &&
            (FormatData.imageFormats[idx].name.contains(searchingText.uppercased()) ||
             searchingText == "") {
            return .Image
        } else if idx >= FormatData.imageFormats.count &&
                    (FormatData.videoFormats[idx-FormatData.imageFormats.count].name.contains(searchingText.uppercased()) ||
                     searchingText == "") {
            return .Video
        } else {
            return nil
        }
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ]) {
                ForEach(0..<FormatData.imageFormats.count+FormatData.videoFormats.count, id: \.self) { idx in
                    // 검색어를 포함하는지 확인하고 뷰 반환
                    if matchFile(idx: idx) == .Image {
                        makeCategoryButton(index: idx, fileType: .Image)
                    } else if matchFile(idx: idx) == .Video {
                        makeCategoryButton(index: idx-FormatData.imageFormats.count, fileType: .Video)
                    }
                }
            }
        }
        .searchable(text: $searchingText, placement: .navigationBarDrawer(displayMode: .always))
        .navigationTitle("검색하기")
        .navigationBarTitleDisplayMode(.inline)
        .background(NavigationLink(destination: DetailView(fileType: selectedFileType, selectedIndex: [selectedIndex]), isActive: $isLinkActive){})
    }
}

struct SearchCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
