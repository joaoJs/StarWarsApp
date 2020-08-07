import Foundation

class ImageCache {
    
    static var sharedCache = ImageCache()
    
    private let cache: NSCache<NSString, NSData>
    
    private init(cache: NSCache<NSString, NSData> = NSCache<NSString, NSData>()) {
        self.cache = cache
    }
    
}

extension ImageCache {
    
    func set(data: Data, name: String) {
        let key = NSString(string: name)
        let object = NSData(data: data)
        self.cache.setObject(object, forKey: key)
    }
    
    func get(name: String) -> Data? {
        let key = NSString(string: name)
        guard let object = self.cache.object(forKey: key) else { return nil }
        return Data(referencing: object)
    }
    
}
