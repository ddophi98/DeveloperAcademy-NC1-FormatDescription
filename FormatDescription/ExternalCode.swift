//
//  ExternalCode.swift
//  FormatDescription
//
//  Created by 김동락 on 2022/05/05.
//

import SwiftUI
import AVKit

// 영상 자동 회전 및 전체화면 지원하기
@available(iOS 14.0, *)
struct AutoRotate: View {
    @State private var showFullScreen = false
    let url: URL
    private let player: AVPlayer
    
    init(url: URL) {
        self.url = url
        self.player = AVPlayer(url: url)
    }
    
    var body: some View {
        playerView
            .ignoresSafeArea()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                DispatchQueue.main.async {
                    if UIDevice.current.orientation.isLandscape {
                        self.showFullScreen = true
                    } else {
                        self.showFullScreen = false
                    }
                }
            }
    }
    
    private var playerView: some View {
        showFullScreen ? AVPlayerControllerRepresentable(showFullScreen: true, player: player) : AVPlayerControllerRepresentable(showFullScreen: false, player: player)
    }
}

@available(iOS 14.0, *)
struct AutoRotate_Previews: PreviewProvider {
    static var previews: some View {
        AutoRotate(url: URL(fileURLWithPath: "https://wolverine.raywenderlich.com/content/ios/tutorials/video_streaming/foxVillage.mp4"))
    }
}


struct AVPlayerControllerRepresentable: UIViewControllerRepresentable {
    let showFullScreen: Bool
    let player: AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller  = AVPlayerViewControllerRotatable()
        controller.player = player
        chooseScreenType(controller)
        return controller
    }
    
    func updateUIViewController(_ controller: AVPlayerViewController, context content: Context) {
        chooseScreenType(controller)
    }
    
    private func chooseScreenType(_ controller: AVPlayerViewController) {
        showFullScreen ? controller.enterFullScreen(animated: true) : controller.exitFullScreen(animated: true)
        
    }
    
    
}

class AVPlayerViewControllerRotatable: AVPlayerViewController {
    
    override var shouldAutorotate: Bool {
        return true
    }
    
}

extension AVPlayerViewController {
    func enterFullScreen(animated: Bool) {
        perform(NSSelectorFromString("enterFullScreenAnimated:completionHandler:"), with: animated, with: nil)
    }
    
    func exitFullScreen(animated: Bool) {
        perform(NSSelectorFromString("exitFullScreenAnimated:completionHandler:"), with: animated, with: nil)
    }
}

// 이미지 확대 기능 지원하기
struct ZoomableScrollView<Content: View>: UIViewRepresentable {
  private var content: Content

  init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }

  func makeUIView(context: Context) -> UIScrollView {
    // set up the UIScrollView
    let scrollView = UIScrollView()
    scrollView.delegate = context.coordinator  // for viewForZooming(in:)
    scrollView.maximumZoomScale = 20
    scrollView.minimumZoomScale = 1
    scrollView.bouncesZoom = true

    // create a UIHostingController to hold our SwiftUI content
    let hostedView = context.coordinator.hostingController.view!
    hostedView.translatesAutoresizingMaskIntoConstraints = true
    hostedView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    hostedView.frame = scrollView.bounds
    scrollView.addSubview(hostedView)

    return scrollView
  }

  func makeCoordinator() -> Coordinator {
    return Coordinator(hostingController: UIHostingController(rootView: self.content))
  }

  func updateUIView(_ uiView: UIScrollView, context: Context) {
    // update the hosting controller's SwiftUI content
    context.coordinator.hostingController.rootView = self.content
    assert(context.coordinator.hostingController.view.superview == uiView)
  }

  class Coordinator: NSObject, UIScrollViewDelegate {
    var hostingController: UIHostingController<Content>

    init(hostingController: UIHostingController<Content>) {
      self.hostingController = hostingController
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
      return hostingController.view
    }
  }
}

// hex값 입력 받을 수 있도록 지원
extension Color {
  init(hex: String) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    
    let r = Double((rgb >> 16) & 0xFF) / 255.0
    let g = Double((rgb >>  8) & 0xFF) / 255.0
    let b = Double((rgb >>  0) & 0xFF) / 255.0
    self.init(red: r, green: g, blue: b)
  }
}
