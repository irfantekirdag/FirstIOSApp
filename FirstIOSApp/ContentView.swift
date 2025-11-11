import SwiftUI
import UIKit

struct ContentView: View {
    // Sayaç değerini tutan state değişkeni
    @State private var count = 0
    @State private var animate = false

    // Minimum ve maksimum sınır
    private let minValue = 0
    private let maxValue = 10

    var body: some View {
        ZStack {
            // Arka plan rengi
            LinearGradient(
                colors: [.blue.opacity(0.3), .purple.opacity(0.4)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 25) {
                Text("Gelişmiş Sayaç")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                // Sayı gösterimi
                Text("\(count)")
                    .font(.system(size: 80, weight: .semibold))
                    .foregroundColor(.white)
                    .scaleEffect(animate ? 1.15 : 1.0)
                    .animation(.spring(response: 0.2, dampingFraction: 0.5), value: animate)
                    .padding()
                    .background(Circle().fill(Color.black.opacity(0.3)))

                // Butonlar
                HStack(spacing: 20) {
                    Button("−") {
                        if count > minValue {
                            count -= 1
                            withAnimation(.spring(response: 0.2, dampingFraction: 0.6)) {
                                animate.toggle()
                            }
                            let generator = UIImpactFeedbackGenerator(style: .medium)
                            generator.impactOccurred()
                        }
                    }
                    .font(.largeTitle)
                    .frame(width: 70, height: 70)
                    .background(Color.red.opacity(0.7))
                    .foregroundColor(.white)
                    .clipShape(Circle())

                    Button("Sıfırla") {
                        count = 0
                        withAnimation(.spring(response: 0.2, dampingFraction: 0.6)) {
                            animate.toggle()
                        }
                        let generator = UIImpactFeedbackGenerator(style: .rigid)
                        generator.impactOccurred()
                    }
                    .font(.headline)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)

                    Button("+") {
                        if count < maxValue {
                            count += 1
                            withAnimation(.spring(response: 0.2, dampingFraction: 0.6)) {
                                animate.toggle()
                            }
                            let generator = UIImpactFeedbackGenerator(style: .medium)
                            generator.impactOccurred()
                        }
                    }
                    .font(.largeTitle)
                    .frame(width: 70, height: 70)
                    .background(Color.green.opacity(0.7))
                    .foregroundColor(.white)
                    .clipShape(Circle())
                }

                // Limit uyarısı
                if count == maxValue {
                    Text("🔝 Maksimum değere ulaştın!")
                        .foregroundColor(.yellow)
                } else if count == minValue {
                    Text("🔻 Minimum değerdesin.")
                        .foregroundColor(.orange)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
