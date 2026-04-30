# Chỉ Mục File Điều Phối

File này quản lý toàn bộ file markdown cần thiết cho quá trình kết hợp ABW x NVIDIA.

## File Chính Trong Control Folder

| File | Vai trò | Khi nào cập nhật |
|---|---|---|
| `README.md` | Tổng quan control folder và định vị hai repo | Khi đổi định vị tổng thể |
| `SESSION_RESTORE.md` | Prompt khởi đầu phiên mới và thứ tự đọc để phục hồi bối cảnh | Khi thêm/bớt file quan trọng |
| `SESSION_CLOSE.md` | Prompt kết thúc phiên và checklist lưu phiên | Khi đổi quy trình lưu phiên |
| `HANDOFF.md` | Trạng thái hiện tại, việc dang dở, việc nên làm tiếp | Cuối mỗi phiên |
| `INTEGRATION_JOURNAL.md` | Lịch sử phát triển chung | Mỗi khi có bước quan trọng |
| `ROADMAP.md` | Việc ngắn hạn/trung hạn/dài hạn | Khi đổi ưu tiên |
| `DECISIONS.md` | Quyết định kiến trúc đã chốt | Khi có quyết định mới |
| `RISKS.md` | Rủi ro và cách phòng | Khi phát hiện rủi ro mới |
| `NEXT.md` | Prompt để Agent gợi ý việc tiếp theo | Khi đổi cách điều phối |
| `BRIDGE_CONTRACT.md` | Contract tích hợp ABW x NVIDIA | Khi thiết kế/đổi bridge |
| `repo-map.json` | Bản đồ đường dẫn repo và vai trò | Khi đổi đường dẫn/repo |

## Prompt Agent

| File | Vai trò |
|---|---|
| `prompts\architect\abw_readme_investigation_prompt.md` | Prompt đã dùng để điều tra ABW và tạo README đề xuất |

## File Liên Quan Trong Repo NVIDIA

| File | Vai trò |
|---|---|
| `D:\Sandbox\Nvidia\README.md` | Roadmap và triết lý NVIDIA Agent Runtime |
| `D:\Sandbox\Nvidia\.nvidia-agent\reports\audit-nvidia-abw-fusion-2026-04-30.md` | Audit fusion ban đầu |

## File Liên Quan Trong Repo ABW

| File | Vai trò |
|---|---|
| `D:\Sandbox\skill-Anti-brain-wiki_note\README.proposed.md` | README ABW đề xuất sau audit |
| `D:\Sandbox\skill-Anti-brain-wiki_note\docs\ABW_ARCHITECTURE_AUDIT_2026-04-30.md` | Audit kiến trúc ABW |

## File Quản Lý Lịch Sử

Lịch sử phát triển chung được quản lý trong:

```text
D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL\INTEGRATION_JOURNAL.md
```

Trạng thái bàn giao mới nhất được quản lý trong:

```text
D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL\HANDOFF.md
```

