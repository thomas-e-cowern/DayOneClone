//
//  Picture.swift
//  MyJournal
//
//  Created by Thomas Cowern on 7/28/23.
//

import Foundation
import RealmSwift
import PhotosUI

class Picture: Object, Identifiable {
    @Persisted var fullImageName = ""
    @Persisted var thumbnailName = ""
    @Persisted var entry: Entry?
    
    convenience init(image: UIImage) {
        self.init()
        fullImageName = imageToUrlString(image: image)
    }
    
    func imageToUrlString(image: UIImage) -> String {
        if let imageData = image.pngData() {
            let fileName = UUID().uuidString + ".png"
            if var path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                path.append(component: fileName)
                try? imageData.write(to: path)
                return fileName
            }
        }
        return ""
    }
    
    func fullImage() -> UIImage {
        return imageWithFileName(fileName: fullImageName)
    }
    
    func imageWithFileName(fileName: String) -> UIImage {
        
        var path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        path?.appendPathComponent(fileName)
        
        if path != nil {
            if let imageData = try? Data(contentsOf: path!) {
                if let image = UIImage(data: imageData) {
                    return image
                }
                
            }
        }
        return UIImage()
    }
}
