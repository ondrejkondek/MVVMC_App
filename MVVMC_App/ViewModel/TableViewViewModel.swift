//
//  TableViewViewModel.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 31/08/2021.
//

import UIKit

class TableViewViewModel {
    // MARK: - Delegates

    var coordinatorDelegate: TableViewViewModelCoordinatorDelegate?

    var viewDelegate: TableViewViewModelViewDelegate?

    // MARK: - Properties

    var people: [Status] = []

    // MARK: - Init

    init(persons: [Status]) {
        people = persons
    }

    func start() {}

    func getSomeExtraPeople() {
        people.append(Status(name: "Ondrej", surname: "Kondek", created: Date(), about: " Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum"))
        people.append(Status(name: "Peter", surname: "Parker", created: Date(), about: "Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum"))
        people.append(Status(name: "John", surname: "Example", created: Date(), about: "Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet, ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."))
        viewDelegate?.updateScreen()
    }

    func updateDataInTable(info: String) {
        people[viewDelegate?.chosenCell ?? 0].about = info
        viewDelegate?.updateScreen()
    }
}

extension TableViewViewModel: TableViewModelType {
    // Data source
    var headerText: String {
        return "Feed"
    }

    func numberOfItems() -> Int {
        return people.count
    }

    // events
    func didSelectRow(row: Int, from: UIViewController) {
        let status = people[row]
        coordinatorDelegate?.getMoreInfo(info: status, vcCaller: from)
    }
}
