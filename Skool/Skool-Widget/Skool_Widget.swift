import WidgetKit
import SwiftUI

struct MealEntry: TimelineEntry {
    let date: Date
    let meal: String
}

struct MealProvider: TimelineProvider {
    // App Group UserDefaults 연결
    let sharedDefaults = UserDefaults(suiteName: "group.com.skool") // App Group 이름

    func placeholder(in context: Context) -> MealEntry {
        MealEntry(date: Date(), meal: "급식 정보를 불러오는 중...")
    }

    func getSnapshot(in context: Context, completion: @escaping (MealEntry) -> Void) {
        let mealData = sharedDefaults?.string(forKey: "mealData") ?? "급식 정보를 가져올 수 없음"
        completion(MealEntry(date: Date(), meal: mealData))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<MealEntry>) -> Void) {
        let mealData = sharedDefaults?.string(forKey: "mealData") ?? "급식 정보를 가져올 수 없음"
        let entry = MealEntry(date: Date(), meal: mealData)

        // 3시간마다 새로고침 요청
        let nextUpdate = Calendar.current.date(byAdding: .hour, value: 3, to: Date()) ?? Date()
        let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))
        completion(timeline)
    }
}

struct MealWidgetEntryView: View {
    var entry: MealProvider.Entry

    var body: some View {
        VStack {
            Text("오늘의 급식")
                .font(.headline)
            if entry.meal.isEmpty {
                Text("급식이 없어요")
            } else {
                Text(entry.meal)
                    .font(.body)
                    .multilineTextAlignment(.center)
            }
        }
        .padding()
    }
}

@main
struct MealWidget: Widget {
    let kind: String = "MealWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: MealProvider()) { entry in
            MealWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("급식 위젯")
        .description("오늘의 급식을 확인하세요.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}
