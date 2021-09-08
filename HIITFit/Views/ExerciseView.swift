
import SwiftUI
import AVKit

struct ExerciseView: View {
    @State private var rating = 0
    @State private var showHistory = false
    @State private var showSuccess = false
    @Binding var selectedTab: Int
    let index: Int
    @State private var timerDone = false
    @State private var showTimer = false
    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }

  var body: some View {
    GeometryReader { geometry in
        VStack {
            HeaderView(
                selectedTab: $selectedTab,
                titleText: Exercise.exercises[index].exerciseName)
                .padding(.bottom)
            if let url = Bundle.main.url(
                forResource: Exercise.exercises[index].videoName, withExtension: "mp4") {
                VideoPlayer(player: AVPlayer(url: url))
                    .frame(height: geometry.size.height * 0.45)
            } else {
                Text("Couldn’t find \(Exercise.exercises[index].videoName).mp4")
                  .foregroundColor(.red)
            }
        
            HStack(spacing: 150) {
              Button("Start Exercise") { // Move buttons above TimerView
                showTimer.toggle()
              }
              Button("Done") {
                  timerDone = false
                showTimer.toggle()
                
                if lastExercise {
                  showSuccess.toggle()
                } else {
                  selectedTab += 1
                }
              }
              .disabled(!timerDone)
              .sheet(isPresented: $showSuccess) {
                SuccessView(selectedTab: $selectedTab)
              }
            }
            .font(.title3)
            .padding()
            if showTimer {
              TimerView(timerDone: $timerDone)
            }
            Spacer()
            RatingView(rating: $rating) // Move RatingView below Spacer
              .padding()
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

struct ExerciseView_Previews: PreviewProvider {
  static var previews: some View {
    ExerciseView(selectedTab: .constant(3), index: 3)
  }
}

