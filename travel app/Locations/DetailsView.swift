import SwiftUI

struct DetailsView: View {
    var place: Attraction
    
    
    @State var isLiked = false
    @Binding var likedPlaces: [Attraction]
    
    var body: some View {
        VStack {

            HStack{
                Text(place.pageTitle)
                    .font(.title)
                    .padding()
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
            
          
            Text(place.overview ?? "")
                .padding()
            
        }
        .navigationTitle("Details")
        .onAppear{
            //check if place is liked
            if likedPlaces.contains(where:{$0.pageTitle == place.pageTitle}){
                isLiked = true
            }
        }
    }
}


#Preview {
    DetailsView(place: Attraction(pageTitle: "Somewhere", latitude: 1.0, longtitude: 2.0), likedPlaces: .constant([Attraction(pageTitle: "aaaaa", latitude: 1.0, longtitude: 1.0)]))
}

