//
//  detailsView.swift
//  travel app
//
//  Created by Shakthi Vel on 27/11/23.
//

import SwiftUI

struct detailsView: View {
<<<<<<< HEAD
    var place: attract
    
    var body: some View {
        VStack {
            Text(place.name)
                .font(.title)
            Text(place.overview)
                .padding()
            
        }
        .navigationTitle("Details")
    }
}
#Preview {
    detailsView(place: attract(name: "Sample",overview: "This is a sample overview"))// attractImage: "1095-national-gallery-singapore-carousel-01-rec"))
}

=======
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    detailsView()
}
>>>>>>> 0e42f93 (...)
