# Sổ Rủi Ro

## Agent Sửa Nhầm Repo

Rủi ro: Agent viết vào sai repository.

Cách phòng:

- Mọi prompt phải ghi rõ workspace duy nhất được phép đọc/ghi.
- Mọi prompt phải ghi rõ path bị cấm sửa.

## Lệch Kiến Trúc

Rủi ro: NVIDIA phát triển thành IDE thuần, ABW phát triển thành CLI thuần, bridge không gặp nhau.

Cách phòng:

- Duy trì control folder này.
- Cập nhật README, audit report, roadmap và journal sau mỗi quyết định quan trọng.

## Phụ Thuộc Provider

Rủi ro: hệ thống phụ thuộc vào NVIDIA miễn phí.

Cách phòng:

- Duy trì model provider abstraction.
- Xem provider là hạ tầng có thể thay thế.

## ABW Bị App Hóa

Rủi ro: ABW hấp thụ UI/runtime và mất trọng tâm governance.

Cách phòng:

- ABW giữ vai trò canonical governance engine.
- NVIDIA giữ vai trò product shell/runtime.

## NVIDIA Bypass ABW

Rủi ro: flow self-improvement trong NVIDIA ghi file hoặc chạy command mà không qua Continuation Kernel.

Cách phòng:

- Bridge policy: không bypass với task rủi ro.
- Thêm audit checks cho ABW gate integration.

## False Grounding

Rủi ro: enterprise chatbot trả lời tự tin dù thiếu bằng chứng.

Cách phòng:

- Bắt buộc trạng thái binding: grounded, draft, pending_grounding, disputed, stale, missing.
- Log gap và dùng trạng thái draft/pending khi thiếu evidence.

## Lộ Dữ Liệu Nhạy Cảm

Rủi ro: `raw/`, `.brain`, reports hoặc logs chứa dữ liệu doanh nghiệp.

Cách phòng:

- Gitignore raw/private state mặc định.
- Chỉ version policy/schema/decision/wiki đã sanitize và được duyệt.

## Overengineering Bridge

Rủi ro: xây FastAPI/gRPC phức tạp trước khi CLI bridge chứng minh giá trị.

Cách phòng:

- CLI bridge trước.
- Chỉ thêm service khi có nhu cầu realtime UI cụ thể.

## Lẫn Vai Agent

Rủi ro: Architect, Builder, Auditor vượt scope của nhau.

Cách phòng:

- Prompt phải ghi rõ role, allowed paths, forbidden paths và output artifacts.

## Thiếu Human Checkpoint

Rủi ro: hệ tự phát triển mà không có điểm dừng duyệt bởi human.

Cách phòng:

- Human approval bắt buộc cho quyết định kiến trúc, bridge milestone, locked decision change và enterprise data policy.

