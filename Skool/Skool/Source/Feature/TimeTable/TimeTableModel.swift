import Foundation

// 시간표 모델
struct TimeTableModel: Codable {
    let hisTimetable: [HisTimetable]
}

// hisTimetable 항목
struct HisTimetable: Codable {
    let row: [TimeTableEntry]?
}

// 시간표 항목
struct TimeTableEntry: Codable, Hashable {
    let perio: String // 교시
    let itrtCntnt: String // 과목명
    let allTiYmd: String // 날짜

    enum CodingKeys: String, CodingKey {
        case perio = "PERIO"
        case itrtCntnt = "ITRT_CNTNT"
        case allTiYmd = "ALL_TI_YMD"
    }
    var formattedItrtCntnt: String {
        return itrtCntnt.replacingOccurrences(of: "*", with: "")
    }
}

