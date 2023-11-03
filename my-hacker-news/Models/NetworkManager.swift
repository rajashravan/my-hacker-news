import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts:[Post] = [] // diff than tutorial
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    // data exists
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            print("got results. about to dispatch update")
                            DispatchQueue.main.async {
                                print("in dispatched function")
                                self.posts = results.hits // part of observer design pattern
                            }
                            
                        } catch {
                            // implicit pass thrown error as `error`
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
