import SwiftUI
import MapKit

struct DetailsView: View {
    var place: Attraction
    
    
    @State var isLiked = false
    @Binding var likedPlaces: [Attraction]
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading){
//                AsyncImage(url: URL(string: place.image ?? "")){image in
//                    image
//                } placeholder: {
//                    ProgressView()
//                }
//                    .scaledToFit()
                
                HStack{
                    Text(place.pageTitle)
                        .font(.title)
                        .bold()
                    Spacer()
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
                            .padding()
                    }
                    
                    
                }
                
              
                Text(place.overview)
                    .padding()
                
                Text("Location")
                    .font(.title)
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
    DetailsView(place: Attraction(pageTitle: "Somewhere", overview: "", latitude: 1.0, longtitude: 2.0), likedPlaces: .constant([Attraction(pageTitle: "aaaaa", overview: "", latitude: 1.0, longtitude: 2.0)]))
}

