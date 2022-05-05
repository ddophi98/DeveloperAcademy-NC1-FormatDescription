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
    let description: [String]
    let volume: Int
    let environment: String
    let fileName: String
    let fileType: FileType
}

class FormatData{
    static let imageFormats = [
        Format(
            name: "JPEG",
            description: [
                "RGB 이미지의 모든 색상 정보를 저장한다.",
                "손실 압축 방식을 이용하긴 하지만 사람의 눈에 거슬리지 않는 부분을 손실시켜, 화질을 최대한 보존한다."
            ],
            volume: 21,
            environment: "",
            fileName: "sample_jpeg",
            fileType: .Image
            ),
        Format(
            name: "PNG",
            description: [
                "비손실 압축 방식을 이용해 원본에 손상 없이 파일의 크기를 줄여준다.",
                "모든 컬러 정보와 알파 채널을 보존하고 있다.",
                "날카로운 경계를 갖고 있는 이미지를 부드럽게 처리해준다.",
                "용량이 비교적 크다."
            ],
            volume: 186,
            environment: "",
            fileName: "sample_png",
            fileType: .Image
            ),
        Format(
            name: "BMP",
            description: [
                "압축이 되지 않은 원본 이미지이다.",
                "화질이 우수하지만 용량이 크다."
            ],
            volume: 1200,
            environment: "Window",
            fileName: "sample_bmp",
            fileType: .Image
            ),
        Format(
            name: "GIF",
            description: [
                "하나의 파일에 여러 비트맵을 저장하여, 다중 프레임 애니메이션을 구현할 수 있다.",
                "8비트 256색상으로 제한된다.",
                "알파 채널을 지원한다."
            ],
            volume: 166,
            environment: "",
            fileName: "sample_gif",
            fileType: .Image
            ),
        Format(
            name: "TIFF",
            description: [
                "맥과 윈도우에서 모두 사용하기 용이하다",
                "여러 색상 모드를 유지한 채 저장 가능하며, 알파 채널을 지원한다.",
                "다양한 압축 방식을 제공한다",
                "파일 용량이 큰 편이다"
            ],
            volume: 1200,
            environment: "",
            fileName: "sample_tiff",
            fileType: .Image
            ),
        Format(
            name: "RAW",
            description: [
                "CCD(카메라의 이미지 센서 등)로부터 얻어진 가공되지 않은 이미지 포맷이다.",
                "제조사마다 다른 확장자를 가지고 있다.(CR2-캐논, SRW-삼성 등)",
                "압축되지 않거나, 무손실 압축 방식을 사용해서 화질이 좋다.",
                "파일 용량이 큰 편이다."
            ],
            volume: 0,
            environment: "",
            fileName: "",
            fileType: .Image
            ),
        Format(
            name: "PSD",
            description: [
                "Adobe Photoshop에서 쓰이는 포맷으로 Adobe사의 다른 프로그램과 쉽게 연동 가능하다.",
                "비트맵 방식을 기본으로 사용한다.",
                "이미지 정보 뿐 아니라 레이어, 패스, 벡터, 채널 등의 정보도 저장할 수 있다."
            ],
            volume: 2400,
            environment: "Adobe Photoshop",
            fileName: "sample_psd",
            fileType: .Image
            ),
        Format(
            name: "SVG",
            description: [
                "XML 언어를 기반으로 하는 포맷이다.",
                "벡터 방식을 사용하므로 크기 조절로 인한 화질이 저하가 없다.",
                "파일 크기가 작고 로드 속도가 빠르다."
            ],
            volume: 3,
            environment: "웹",
            fileName: "sample_svg",
            fileType: .Image
            ),
        Format(
            name: "WebP",
            description: [
                "웹에서 사용되는 기존 GIf, JPEG, PNG 등의 포맷을 대체하기 위해 개발되었다.",
                "알파 채널을 지원한다.",
                "손실 압축, 무손실 압축을 모두 지원한다.",
                "파일 크기가 비교적 작다."
            ],
            volume: 25,
            environment: "웹",
            fileName: "sample_webp",
            fileType: .Image
            ),
        Format(
            name: "EPS",
            description: [
                "인쇄 및 출력을 위한 포맷이다.",
                "벡터와 비트맵 이미지를 동시에 저장 가능하다.",
                "CMYK(색상 모형) 모드를 완벽하게 지원한다."
            ],
            volume: 7,
            environment: "인쇄 및 출력",
            fileName: "sample_eps",
            fileType: .Image
            ),
        Format(
            name: "PDF",
            description: [
                "다양한 운영체제에서 쉽게 주고 받을 수 있다.",
                "주로 문서를 이미지화하기 위해 사용된다.",
                "벡터 방식을 사용하므로 크기 조절로 인한 화질이 저하가 없다.",
                "PDF 파일 자체를 편집하기는 어렵다.",
                "파일 크기가 비교적 작다."
            ],
            volume: 23,
            environment: "문서",
            fileName: "sample_pdf",
            fileType: .Image
            ),
        Format(
            name: "AI",
            description: [
                "Adobe illustrator에서 쓰이는 포맷으로 Adobe사의 다른 프로그램과 쉽게 연동 가능하다.",
                "벡터 방식을 사용하므로 크기 조절로 인한 화질이 저하가 없다",
                "로고 제작, 캐릭터 작업 등 새로운 것을 창조해내는 작업에 유용하다."
            ],
            volume: 4,
            environment: "Adobe illustrator",
            fileName: "sample_ai",
            fileType: .Image
            ),
    ]
    static let videoFormats = [
        Format(
            name: "MP4",
            description: [
                "높은 압축률을 보여주는 H.264 코덱을 주로 사용한다.",
                "인터넷을 통한 스트리밍을 지원한다.",
                "편집, 출력, 재생 시 높은 사양이 요구될 수 있다."
            ],
            volume: 3400,
            environment: "",
            fileName: "https://dm0qx8t0i9gc9.cloudfront.net/watermarks/video/GTYSdDW/sunlight-through-trees-in-redwood-forest__7a9b3cb5ab25d4d3b8f4f397ce4b085d__P360.mp4",
            fileType: .Video
            ),
        Format(
            name: "AVI",
            description: [
                "다양한 종류의 코덱을 지원하여 여러 환경에서 재생할 수 있다.",
                "본래 용도는 PC에서 재생되는 것이라, 다른 기기에서는 제한이 있을 수도 있다."
            ],
            volume: 0,
            environment: "Window",
            fileName: "https://dm0qx8t0i9gc9.cloudfront.net/watermarks/video/GTYSdDW/sunlight-through-trees-in-redwood-forest__7a9b3cb5ab25d4d3b8f4f397ce4b085d__P360.mp4",
            fileType: .Video
            ),
        Format(
            name: "WMV",
            description: [
                "DRM. 메타정보 같은 추가 정보들을 제공한다.",
                "높은 압축률로 파일 용량을 작게 만들기 때문에 실시간 스트리밍에 적합하다."
            ],
            volume: 0,
            environment: "Window",
            fileName: "sample_jpeg",
            fileType: .Video
            ),
        Format(
            name: "MKV",
            description: [
                "개수 제한 없이 비디오, 오디오, 그림, 자막 등 멀티미디어 콘텐츠를 담기 위한 포맷이다.",
                "코덱 종류에 상관없이 모든 스트림을 담을 수 있다."
            ],
            volume: 0,
            environment: "",
            fileName: "sample_jpeg",
            fileType: .Video
            ),
        Format(
            name: "MOV",
            description: [
                "다양한 종류의 코덱을 지원하여 여러 환경에서 재생할 수 있다.",
                "실시간 스트리밍을 지원하며 VR 기능도 지원한다."
            ],
            volume: 0,
            environment: "Mac",
            fileName: "sample_jpeg",
            fileType: .Video
            ),
        Format(
            name: "MPEG-PS/TS",
            description: [
                "디지털 방송 등의 곳에서 MPEG 영상을 효율적으로 전송하기 위해 설계된 포맷이다.",
                "TS는 전송, PS는 저장에 목적이 있다.",
                "원본에 가까운 고화질의 영상을 볼 수 있다.",
                "패킷 단위로 재생되기 때문에 압축이 되지 않아 용량이 큰 편에 속한다."
            ],
            volume: 0,
            environment: "디지털 방송",
            fileName: "sample_jpeg",
            fileType: .Video
            ),
        Format(
            name: "3GP",
            description: [
                "3G 모바일 환경에서 사용하도록 만들어진 컨테이너로 MP4의 단순화 버전이다.",
                "최대 파일 크기와 해상도가 제한될 수 있다."
            ],
            volume: 0,
            environment: "3G 모바일 환경",
            fileName: "sample_jpeg",
            fileType: .Video
            ),
        Format(
            name: "WebM",
            description: [
                "웹에 최적화된 미디어 포맷으로 HTML5에서 기본으로 지원한다.",
                "스트리밍 환경에서 비교적 안정적이다.",
                "압축률과 인코딩 효율이 비교적 떨어진다."
            ],
            volume: 0,
            environment: "웹",
            fileName: "sample_jpeg",
            fileType: .Video
            ),
    ]
 }
