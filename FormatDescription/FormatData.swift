//
//  FormatData.swift
//  FormatDescription
//
//  Created by 김동락 on 2022/04/28.
//

import SwiftUI
import AVKit

enum FileType {
    case Image, Video
}

struct Format{
    let name: String
    let description: String
    let volume: Int
    let environment: String
    let fileName: String
}

class FormatData{
    static let imageFormats = [
        Format(
            name: "JPEG",
            description: "JPEG 이미지 입니다 JPEG 이미지 입니다 JPEG 이미지 입니다 JPEG 이미지 입니다 JPEG 이미지 입니다 JPEG 이미지 입니다 JPEG 이미지 입니다",
            volume: 1000,
            environment: "제한없음",
            fileName: "sample_jpeg"
            ),
        Format(
            name: "PNG",
            description: "PNG 이미지 입니디",
            volume: 1000,
            environment: "제한없음",
            fileName: "sample_jpeg"
            ),
        Format(
            name: "BMP",
            description: "BMP 이미지 입니디",
            volume: 1000,
            environment: "제한없음",
            fileName: "sample_jpeg"
            ),
        Format(
            name: "GIF",
            description: "GIF 이미지 입니디",
            volume: 1000,
            environment: "제한없음",
            fileName: "sample_jpeg"
            ),
        Format(
            name: "TIFF",
            description: "TIFF 이미지 입니디",
            volume: 1000,
            environment: "제한없음",
            fileName: "sample_jpeg"
            ),
        Format(
            name: "RAW",
            description: "RAW 이미지 입니디",
            volume: 1000,
            environment: "제한없음",
            fileName: "sample_jpeg"
            ),
        Format(
            name: "PSD",
            description: "PSD 이미지 입니디",
            volume: 1000,
            environment: "제한없음",
            fileName: "sample_jpeg"
            ),
        Format(
            name: "TGA",
            description: "TGA 이미지 입니디",
            volume: 1000,
            environment: "제한없음",
            fileName: "sample_jpeg"
            ),
        Format(
            name: "SVG",
            description: "SVG 이미지 입니디",
            volume: 1000,
            environment: "제한없음",
            fileName: "sample_jpeg"
            ),
        Format(
            name: "WebP",
            description: "WebP 이미지 입니디",
            volume: 1000,
            environment: "제한없음",
            fileName: "sample_jpeg"
            ),
        Format(
            name: "EPS",
            description: "EPS 이미지 입니디",
            volume: 1000,
            environment: "제한없음",
            fileName: "sample_jpeg"
            ),
        Format(
            name: "PDF",
            description: "PDF 이미지 입니디",
            volume: 1000,
            environment: "제한없음",
            fileName: "sample_jpeg"
            ),
        Format(
            name: "AI",
            description: "AI 이미지 입니디",
            volume: 1000,
            environment: "제한없음",
            fileName: "sample_jpeg"
            ),
    ]
    static let videoFormats = [
        Format(
            name: "MP4",
            description: "MP4 비디오 입니디",
            volume: 1000,
            environment: "제한없음",
            fileName: "sample_jpeg"
            ),
        Format(
            name: "AVI",
            description: "AVI 비디오 입니디",
            volume: 1000,
            environment: "제한없음",
            fileName: "sample_jpeg"
            ),
        Format(
            name: "WMV",
            description: "WMV 비디오 입니디",
            volume: 1000,
            environment: "제한없음",
            fileName: "sample_jpeg"
            ),
        Format(
            name: "MKV",
            description: "MKV 비디오 입니디",
            volume: 1000,
            environment: "제한없음",
            fileName: "sample_jpeg"
            ),
        Format(
            name: "MOV",
            description: "MOV 비디오 입니디",
            volume: 1000,
            environment: "제한없음",
            fileName: "sample_jpeg"
            ),
        Format(
            name: "MPEG-PS/TS",
            description: "MPEG-PS/TS 비디오 입니디",
            volume: 1000,
            environment: "제한없음",
            fileName: "sample_jpeg"
            ),
        Format(
            name: "3GP",
            description: "3GP 비디오 입니디",
            volume: 1000,
            environment: "제한없음",
            fileName: "sample_jpeg"
            ),
        Format(
            name: "FLV",
            description: "FLV 비디오 입니디",
            volume: 1000,
            environment: "제한없음",
            fileName: "sample_jpeg"
            ),
        Format(
            name: "WebM",
            description: "WebM 비디오 입니디",
            volume: 1000,
            environment: "제한없음",
            fileName: "sample_jpeg"
            ),
    ]
 }
