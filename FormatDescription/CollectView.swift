//
//  CollectView.swift
//  FormatDescription
//
//  Created by 김동락 on 2022/04/28.
//

import SwiftUI
import AVKit

struct CollectView: View {
    // 이미지 누르면 확대할 수 있는 뷰를 반환
    func getDestination(format: Format) -> some View{
        return ZoomableScrollView{
            Image(format.fileName)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
    // 파일을 표시할 수 있는지 여부에 따라 다른 뷰를 반환
    func getFile(format: Format) -> some View{
        if format.fileType == .Image {
            if UIImage(named: format.fileName) != nil{
                return AnyView(Image(format.fileName)
                    .resizable()
                    .cornerRadius(20)
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 5)
                    .padding(.bottom, 5)
                    .overlay(alignment: .bottomTrailing){
                        NavigationLink(destination: getDestination(format: format)){
                            Image(systemName: "plus.magnifyingglass")
                                .padding(.bottom, 15)
                                .padding(.trailing, 15)
                                .font(.system(size: 20))
                        }
                    })
            } else {
                return AnyView(Rectangle()
                    .frame(width: 150, height: 100)
                    .foregroundColor(Color.white)
                    .overlay{
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                    }
                    .overlay{
                        Text("해당 포맷은 표시할 수 없습니다")
                            .font(.system(size: 15))
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                    .padding(.bottom, 10))
            }
        } else {
            if let videoUrl = URL(string: format.fileName){
                return AnyView(AutoRotate(url: videoUrl)
                    .frame(width: 150, height: 100))
            }
            else {
                return AnyView(Rectangle()
                    .frame(width: 150, height: 100)
                    .foregroundColor(Color.white)
                    .overlay{
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                    }
                    .overlay{
                        Text("해당 포맷은 표시할 수 없습니다")
                            .font(.system(size: 25))
                            .multilineTextAlignment(.center)
                            .padding()
                    })
            }
        }
    }
    // 그리드뷰 제작
    func makeGridView(datas: [Format]) -> some View {
        return LazyVGrid(columns: [
            GridItem(.flexible(), alignment: .top),
            GridItem(.flexible(), alignment: .top)
        ]) {
            ForEach(datas, id: \.name) { format in
                VStack (spacing: 5){
                    Text("\(format.name)")
                        .font(.system(size: 20, weight: .semibold))
                    getFile(format: format)
                    VStack (alignment: .leading) {
                        Label {
                            Text("용량: \(format.volume)KB")
                                .font(.system(size: 15))
                        } icon : {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 5))
                        }
                        if !format.environment.isEmpty {
                            Label {
                                Text("주 사용환경: \(format.environment)")
                                    .font(.system(size: 15))
                            } icon : {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 5))
                            }
                        }
                    }
                    .padding()
                    .frame(width: 150, alignment: .leading)
                    .foregroundColor(Color.black)
                    .background(Color(hex: "#FFE3E5"))
                    .cornerRadius(15)
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
            }
        }
        .padding(.bottom, 20)
    }
    var body: some View {
        VStack {
            ScrollView {
                // 이미지 타이틀
                Text("이미지")
                    .padding()
                    .font(.system(size: 25, weight: .semibold))
                    .frame(width: 350)
                    .foregroundColor(Color.black)
                    .background(Color(hex: "#EEE7F9"))
                    .cornerRadius(15)
                // 이미지 모아서 보여주기
                makeGridView(datas: FormatData.imageFormats)
                // 비디오 타이틀
                Text("비디오")
                    .padding()
                    .font(.system(size: 25, weight: .semibold))
                    .frame(width: 350)
                    .foregroundColor(Color.black)
                    .background(Color(hex: "#EEE7F9"))
                    .cornerRadius(15)
                // 비디오 모아서 보여주기
                makeGridView(datas: FormatData.videoFormats)
            }
        }
    }
}

struct CollectView_Previews: PreviewProvider {
    static var previews: some View {
        CollectView()
    }
}
