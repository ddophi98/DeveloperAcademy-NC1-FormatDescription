//
//  DetailView.swift
//  FormatDescription
//
//  Created by 김동락 on 2022/04/29.
//

import SwiftUI

struct DetailView: View {
    let fileType: FileType
    var actionButtons = [ActionSheet.Button]()
    var showingFormats = [Format]()
    @State var showActionSheet:Bool = false
    
    // 선택한 카테고리 정보 보여주도록 설정하기
    init(fileType: FileType, selectedIndex: Int){
        self.fileType = fileType
        if fileType == .Image {
            showingFormats.append(FormatData.imageFormats[selectedIndex])
            for format in FormatData.imageFormats {
                actionButtons.append(
                    .default(
                        Text("\(format.name)")
                    ){
//                        showingFormats.append(FormatData.imageFormats[index])
                    }
                )
            }
        } else {
            showingFormats.append(FormatData.videoFormats[selectedIndex])
        }
        actionButtons.append(.cancel(Text("취소")))
    }
    
    var body: some View {
        VStack {
            // 페이지 뷰 구현
            TabView {
                ForEach(showingFormats, id: \.name){ format in
                    VStack{
                        Image(format.fileName)
                            .resizable()
                            .cornerRadius(20)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 320)
                            .padding(.top, 20)
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
                        .frame(width: 320,height: 270)
                        .foregroundColor(Color.black)
                        .background(Color(hex: "#EEE7F9"))
                        .cornerRadius(15)
                        Spacer()
                    }
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            //페이지 추가 버튼
            Button (action: {
                showActionSheet = true
            }) {
                Text("비교할 포맷 추가")
                    .foregroundColor(Color.black)
                    .font(.system(size: 20, weight: .bold))
                    .frame(width: 200, height: 70)
                    .background(Color(hex: "#CEE0F9"))
                    .cornerRadius(15)
                    .shadow(radius: 5, x: 5, y: 5)
                    .padding(30)
            }
        }
        .actionSheet(isPresented: $showActionSheet){
            ActionSheet(
                title: Text("포맷"),
                message: Text("비교하고 싶은 포맷을 추가하새요"),
                buttons: actionButtons
            )
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(fileType: .Image, selectedIndex: 0)
    }
}

