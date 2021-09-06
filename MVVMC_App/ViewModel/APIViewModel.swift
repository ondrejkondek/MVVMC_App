//
//  APIViewModel.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 31/08/2021.
//

import Foundation

struct APIResponse: Codable {
    let name: String
    let age: Int
    let count: Int
}

class APIViewModel {
    let service: String
    var viewDelegate: APIViewModelViewDelegate?

    init() {
        service = "https://api.agify.io/?name="
    }

    func getURL(name: String) -> String {
        // encode string! / url allowed
        let encodedName = name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        return service + (encodedName ?? "")
    }

    func apiCall(name: String) {
        let url = getURL(name: name)

        guard let URLstring = URL(string: url) else {
            viewDelegate?.noInternetAlert()
            return
        }
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
