
import SwiftUI

struct WelcomeView: View {
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
            Button(action: {}) {
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
            HeaderView(titleText: NSLocalizedString("Welcome", comment: "greetings"))
            Spacer()
            Button(NSLocalizedString("History", comment: "view user activity")) {}
                .padding(.bottom)
        }
    }
  }
}

struct WelcomeView_Previews: PreviewProvider {
  static var previews: some View {
    WelcomeView()
  }
}
