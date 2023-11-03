import SwiftUI
import WebKit


struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if self.urlString != nil {
            if let url = URL(string: self.urlString!) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
    
}
