import SwiftUI
import MapKit

struct DetailsView: View {
    var place: Attraction
    
    
    @State var isLiked = false
    @Binding var likedPlaces: [Attraction]
    
    var body: some View {
        ScrollView {
            VStack (alignment: .center){
                //                AsyncImage(url: URL(string: place.image ?? "")){image in
                //                    image
                //                } placeholder: {
                //                    ProgressView()
                //                }
                //                    .scaledToFit()
                
                
                
                
                
                Text(place.pageTitle)
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .bold()
                    .padding()
                
                Button{
                    //when place is already liked
                    if isLiked {
                        //check if they dislike
                        if likedPlaces.contains(where:{$0.pageTitle == place.pageTitle}){
                            //remove from likedPlaces
                            likedPlaces.removeAll { likedPlace in
                                likedPlace.pageTitle == place.pageTitle
                            }
                            //change liked status
                            isLiked = false
                        }
                        
                    } else {
                        //place is not yet liked, but button pressed
                        if !likedPlaces.contains(where:{$0.pageTitle == place.pageTitle}){
                            likedPlaces.append(place)
                            isLiked = true
                        }
                        
                    }
                } label:{
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                }
                
                Text(place.overview)
                    .padding()
                
                Text("Location")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title2)
                    .bold()
                Map(){
                    Marker(place.pageTitle, coordinate: CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longtitude))
                }
                .frame(width: 350, height: 250)
                
            }
            .padding()
            .navigationTitle("Details")
            .onAppear{
                //check if place is liked
                if likedPlaces.contains(where:{$0.pageTitle == place.pageTitle}){
                    isLiked = true
                }
            }
        }
    }
}


#Preview {
    DetailsView(place: Attraction(pageTitle: "National Gallery Singapore", overview: "where skies blueee", latitude: 1.0, longtitude: 2.0), likedPlaces: .constant([Attraction(pageTitle: "aaaaa", overview: "", latitude: 1.0, longtitude: 2.0)]))
}

