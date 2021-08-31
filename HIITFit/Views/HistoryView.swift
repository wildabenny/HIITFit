
import SwiftUI

struct HistoryView: View {
    let today = Date()
    let yesterday = Date().addingTimeInterval(-86400)
    
    let excercises1 = ["Squat", "Step Up", "Burpee", "Sun Salute"]
    let excercises2 = ["Squat", "Step Up", "Burpee"]
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button(action:{}) {
                Image(systemName: "xmark.circle")
            }
            .font(.title)
            .padding(.trailing)
            VStack{
                Text("History")
                    .font(.title)
                    .padding()
                Form {
                    Section(
                        header:
                            Text(today.formatted(as: "MMM d"))
                            .font(.headline)) {
                        ForEach(excercises1, id: \.self) { excercise in
                            Text(excercise)
                        }
                    }
                    Section(
                        header:
                            Text(yesterday.formatted(as: "MMM d"))
                            .font(.headline)) {
                        ForEach(excercises2, id: \.self) { excersize in
                            Text(excersize)
                        }
                    }
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
