import SwiftUI

struct DetailsView: View {
    var place: Attraction
    
    var body: some View {
        VStack {
//            Image(place.attractImage ?? "sad")
//                .resizable()
//                .scaledToFit()
            Text(place.pageTitle)
                .font(.title)
            Text(place.overview ?? "")
                .padding()
            
        }
        .navigationTitle("Details")
    }
}


#Preview {
    DetailsView(place: Attraction(pageTitle: "Somewhere", latitude: 1.0, longtitude: 2.0))// attractImage: "1095-national-gallery-singapore-carousel-01-rec"))
}

