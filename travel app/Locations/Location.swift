//
//  Location.swift
//  travel app
//
//  Created by Shakthi Vel on 22/11/23.
//

import MapKit

struct SearchCompletions: Identifiable {
    let id = UUID()
    let title: String
    let subTitle: String
}

@Observable
class LocationService: NSObject, MKLocalSearchCompleterDelegate {
    private let completer: MKLocalSearchCompleter

    var completions = [SearchCompletions]()

    init(completer: MKLocalSearchCompleter) {
        self.completer = completer
        super.init()
        self.completer.delegate = self
    }

    func update(queryFragment: String) {
        completer.resultTypes = .pointOfInterest
        completer.queryFragment = queryFragment
    }

    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        completions = completer.results.map { .init(title: $0.title, subTitle: $0.subtitle) }
    }
}
