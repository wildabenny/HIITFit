
import SwiftUI

struct SuccessView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedTab: Int
    
    let message = """
        Good job completing all four excercises
        Remember tommorow's another day
        So eat well and get some rest
        """
    
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "hand.raised.fill")
                    .resizedToFill(width: 75, height: 75)
                    .foregroundColor(.purple)
                Text("High Five!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Text(message)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
            }
            VStack {
                Spacer()
                Button("Continue") {
                    presentationMode.wrappedValue.dismiss()
                    selectedTab = 9
                }
                    .padding(.bottom)
            }
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(selectedTab: .constant(3))
    }
}
