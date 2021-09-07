
import SwiftUI

struct WelcomeView: View {
    @State private var showHistory = false
    @Binding var selectedTab: Int
    
  var body: some View {
    ZStack {
        VStack {
            HStack(alignment: .bottom) {
                VStack(alignment:.leading) {
                    Text(NSLocalizedString("Get Fit", comment: "invitation to exercise"))
                        .font(.largeTitle)
                    Text("with high intensity interval training")
                        .font(.headline)
                }
                Image("step-up")
                    .resizedToFill(width: 240, height: 240)
                    .clipShape(Circle())
            }
            Button(action: {selectedTab = 0}) {
                Text(NSLocalizedString("Get Started", comment: "invitation"))
                Image(systemName: "arrow.right.circle")
            }
            .font(.title2)
            .padding()
            .background(
              RoundedRectangle(cornerRadius: 20)
              .stroke(Color.gray, lineWidth: 2))
        }
        VStack {
            HeaderView(selectedTab: $selectedTab, titleText: NSLocalizedString("Welcome", comment: "greetings"))
            Spacer()
            Button(NSLocalizedString("History", comment: "view user activity")) {
                showHistory.toggle()
            }
            .padding(.bottom)
            .sheet(isPresented: $showHistory) {
                HistoryView(showHistory: $showHistory)
            }
        }
    }
  }
}

struct WelcomeView_Previews: PreviewProvider {
  static var previews: some View {
    WelcomeView(selectedTab: .constant(1))
  }
}
