//
//  Picture.swift
//  MyJournal
//
//  Created by Thomas Cowern on 7/28/23.
//

import Foundation
import RealmSwift
import PhotosUI

class Picture: Object {
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
}
