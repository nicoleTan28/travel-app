import SwiftUI

struct DetailsView: View {
    var place: Attraction
    
    
    @State private var isLiked = true
    @Binding var likedPlaces: [Attraction]
    
    var body: some View {
        VStack {
//            Image(place.attractImage ?? "sad")
//                .resizable()
//                .scaledToFit()
            HStack{
                Text(place.pageTitle)
                    .font(.title)
                Image(systemName: isLiked ? "heart" : "heart.fill")
                    .onTapGesture {
                        isLiked.toggle()
                    }
            }
            
          
            Text(place.overview ?? "")
                .padding()
            
        }
        .navigationTitle("Details")
        .onAppear{
            if isLiked {
                likedPlaces.append(Attraction(pageTitle: place.pageTitle, latitude: place.latitude, longtitude: place.longtitude))
            }
        }
    }
}


#Preview {
    DetailsView(place: Attraction(pageTitle: "Somewhere", latitude: 1.0, longtitude: 2.0), likedPlaces: .constant([Attraction(pageTitle: "aaaaa", latitude: 1.0, longtitude: 1.0)]))// attractImage: "1095-national-gallery-singapore-carousel-01-rec"))
}

