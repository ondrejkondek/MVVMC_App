//
//  APIViewModel.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 31/08/2021.
//

import Foundation

class APIViewModel {
    let service: String
    var viewDelegate: APIViewModelViewDelegate?

    init() {
        service = "https://api.agify.io/?name="
    }

    func getURL(name: String) -> String {
        return service + name
    }

    func apiCall(name: String) {
        let url = getURL(name: name)
        // encode string! / url allowed
        guard let URLstring = URL(string: url) else {
            return
        }
        print(url)
        let task = URLSession.shared.dataTask(with: URLstring, completionHandler: {
            data, _, error in
            guard let data = data, error == nil else {
                print("Problem occured!")
                self.viewDelegate?.noInternetAlert()
                return
            }

            var result: APIResponse?
            do {
                result = try JSONDecoder().decode(APIResponse.self, from: data)
            } catch {
                print("Unable to decode")
                self.viewDelegate?.noInternetAlert()
                return
            }

            let age = String(result?.age ?? 0)
            self.viewDelegate?.updateLabel(content: age)
        })
        task.resume()
    }
}

struct APIResponse: Codable {
    let name: String
    let age: Int
    let count: Int
}
