//
//  CollectView.swift
//  FormatDescription
//
//  Created by 김동락 on 2022/04/28.
//

import SwiftUI

struct CollectView: View {
    var body: some View {
        VStack {
            ScrollView {
                Text("이미지")
                    .padding()
                    .font(.system(size: 25))
                    .frame(width: 350)
                    .foregroundColor(Color.black)
                    .background(Color(hex: "#EEE7F9"))
                    .cornerRadius(15)
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ]) {
                    ForEach(FormatData.imageFormats, id: \.name) { format in
                        VStack (spacing: 5){
                            Text("\(format.name)")
                                .font(.system(size: 20))
                            Image(format.fileName)
                                .resizable()
                                .cornerRadius(20)
                                .aspectRatio(contentMode: .fit)
                                .padding(.horizontal, 5)
                                .padding(.bottom, 5)
                            VStack (alignment: .leading) {
                                Text("용량: \(format.volume)")
                                    .font(.system(size: 15))
                                Text("사용환경: \(format.environment)")
                                    .font(.system(size: 15))
                            }
                            .padding()
                            .frame(width: 150)
                            .foregroundColor(Color.black)
                            .background(Color(hex: "#FFE3E5"))
                            .cornerRadius(15)
                        }
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                    }
                }
                .padding(.bottom, 20)
                
                Text("비디오")
                    .padding()
                    .font(.system(size: 30))
                    .frame(width: 350)
                    .foregroundColor(Color.black)
                    .background(Color(hex: "#EEE7F9"))
                    .cornerRadius(15)
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ]) {
                    ForEach(FormatData.videoFormats, id: \.name) { format in
                        VStack (spacing: 5){
                            Text("\(format.name)")
                                .font(.system(size: 20))
                            Image(format.fileName)
                                .resizable()
                                .cornerRadius(20)
                                .aspectRatio(contentMode: .fit)
                                .padding(.horizontal, 5)
                                .padding(.bottom, 5)
                            VStack (alignment: .leading) {
                                Text("용량: \(format.volume)")
                                    .font(.system(size: 15))
                                Text("사용환경: \(format.environment)")
                                    .font(.system(size: 15))
                            }
                            .padding()
                            .frame(width: 150)
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
        }
        .navigationTitle("모아보기")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CollectView_Previews: PreviewProvider {
    static var previews: some View {
        CollectView()
    }
}
