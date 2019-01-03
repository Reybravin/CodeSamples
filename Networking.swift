//
//  Networking.swift
//  SampleCode
//
//  Created by Sergiy Sachuk on 6/9/18.
//  Copyright © 2018 Sergiy Sachuk. All rights reserved.
//

import Foundation

fileprivate func fetchGenericData<T: Decodable>(urlString: String, completion: @escaping (T)->()) {
   let url = URL(string: urlString)
   URLSession.shared.dataTask(with: url!) { (data, resp, err) in
      
      if let err = err {
         print("Failed to fetch data:", err)
         return
      }
      
      guard let data = data else { return }
      do {
         let obj = try JSONDecoder().decode(T.self, from: data)
         completion(obj)
      } catch let jsonErr {
         print("Failed to decode json", jsonErr)
      }
   }.resume()
}

//fetchGenericData(urlString: "https://api.letsbuildthatapp.com/jsondecodable/cources/") { (courses: [Course]) in
//   courses.forEach({print($0.link)})
//}
//
//struct Course: Decodable {
//   let id: Int
//   let name: String
//   let link: String
//}
