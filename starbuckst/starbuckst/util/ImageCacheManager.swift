//
//  ImageCache.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/16.
//

import UIKit
import Foundation
public class ImageCacheManager {
    
    public static let publicCacheManager = ImageCacheManager()
    
    private let cachedImages = NSCache<NSURL, UIImage>()
    
    private var loadingResponses = [NSURL: [(ImageItem, UIImage?) -> Swift.Void]]()
    
    private init() { }
    
    private final func getCachedImage(url: NSURL) -> UIImage? {
        return cachedImages.object(forKey: url)
    }
    
// 이미지가 있다면 캐싱된 이미지를 반환하고, 그렇지 않으면 비동기적으로 이미지를 로드 및 캐시합니다.
    final func loadImage(url: NSURL, imageItem: ImageItem, completion: @escaping (ImageItem, UIImage?) -> Swift.Void) {
        // 해당 이미지가 캐시되어 있다면 찾은 이미지를 반환합니다.
        if let cachedImage = getCachedImage(url: url) {
            DispatchQueue.main.async { // 왜 비동기?
                completion(imageItem, cachedImage)
            }
            return
        }
        
        if loadingResponses[url] != nil { // 해당 이미지에 대해 둘 이상의 요청이 있는 경우, loadingResponses에 completion 블록을 추가합니다.
            loadingResponses[url]?.append(completion)
            return
        } else { // 해당 이미지에 대해 첫 요청인 경우 loadingResponses에 completion 등록
            loadingResponses[url] = [completion]
        }
        
        // (URL로부터) 이미지를 받아옵니다.
        // URLSession(.ephimeral) : NSCache를 따로 사용하므로 URLSession의 캐시를 사용하지 않기 위한 설정
        let urlSession = URLSession(configuration: URLSessionConfiguration.ephemeral)
        urlSession.dataTask(with: url as URL) { (data, response, error) in
            // error와 data를 체크하고 이미지 생성을 시도합니다.
            guard let responseData = data,
                  let image = UIImage(data: responseData),
                  let responseBlocks = self.loadingResponses[url],
                  error == nil else { // 넷 중에 하나라도 nil이면 completion으로 nil을 전달하며 리턴
                DispatchQueue.main.async {
                    completion(imageItem, nil)
                }
                return
            }
            // 받아온 이미지를 캐시에 저장합니다.
            self.cachedImages.setObject(image, forKey: url, cost: responseData.count)
            // 해당 이미지의 요청들에 대해 반복해서 이미지를 전달합니다.
            for block in responseBlocks {
                DispatchQueue.main.async {
                    block(imageItem, image)
                }
                return
            }
        }.resume()
    }
}
