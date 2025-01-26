//
//  ImageLoader.swift
//  MovieApp
//
//  Created by Adi Andrea on 25/01/25.
//
import SwiftUI

@MainActor
class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    //Creates an in-memory cache for images/
    private var cache = NSCache<NSURL, UIImage>()
    
    func loadImage(urlString: String) async {
        //convert string into URL object safely
        guard let url = URL(string: urlString) else { return }
        
        // use chache if any
        if let cachedImage = cache.object(forKey: url as NSURL) {
            image = cachedImage
            return
        }
        
        do {
            //download image
            let (data,_) = try await URLSession.shared.data(from: url)
            
            //convert image data to UIImage
            if let downloadedImage = UIImage(data: data) {
                //store image in cache
                cache.setObject(downloadedImage, forKey: url as NSURL)
                //update image
                image = downloadedImage
            }
        } catch {
            print("error loading image: \(error)")
        }
    }
}
